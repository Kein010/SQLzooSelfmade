import 'package:mysql_utils/mysql_utils.dart';
import 'package:sql_zoo_selfmade/res/database.dart';
import 'dart:io';

//TODO: check if user entert only one username or password corectly -> give right message
//TODO: give different messages when user is created or already exists
//TODO: add better error handling/ cases that can come up
//TODO: There is no register. its already in login. -what did he mean by this?
/// Checks if a user exists in the database.
///
/// This function takes in the user's email, username, and password and
/// checks if the user exists in the "users" table of the database.
///
/// Parameters:
/// - email: The user's email.
/// - username: The user's username.
/// - password: The user's password.
///
/// Returns a Future that resolves to a boolean. True if the user exists,
/// false otherwise.
Future<bool> checkIfUserExists(String email, String username, String password) async {
  // Check if username and password are not empty
  if (username.isNotEmpty && password.isNotEmpty) {
    // Connect to the database
    final conn = await connectToDatabase("127.0.0.1", 3306, "root", "root", "users");
    
    // Query the database for the user
    // TODO change to conn.getOne()
    var result = await conn.query(
      "SELECT * FROM userAccounts WHERE email = $email AND username = $username AND password = $password",
    );
    // If the user does not exist, insert the user into the database
    if (result.rows.isEmpty) {
      await conn.insert(
        table: 'userAccounts',
        debug: false,
        insertData: {
          'email': email,
          'username': username,
          'password': password,
        },
      );
      conn.close();
      return true;
    }
    
    // The user exists, return true
    conn.close();
    return true;
  }
  
  // One or both of the username and password are empty, return false
  return false;
}

/// Deletes a user from the database.
/// @param {String} username - The username of the user to be deleted.
/// @return {Future<bool>} - A Future that resolves to true if the user was successfully deleted, or false otherwise.
/// TODO - add error handling? make this better
Future <bool> deleteUser(String email) async{
  final conn = await connectToDatabase("127.0.0.1", 3306, "root", "root", "users");

  var result = await conn.query("DELETE FROM userAccounts WHERE email = "+ email);
  if (result.affectedRows! > 0) {
    conn.close();
    return true;
  }
  else{
    conn.close();
    return false;
  }
}

// untested but otherwise everything is ready to continue
Future resetDatabase(String query) async {
 final connection = await connectToDatabase("127.0.0.1", 3306, "root", "root", "sakila");
  try {
      
      
      //Get SQL commands from file
      String sqlInsert = await File('InsertData.sql').readAsString();
      
      await connection.query(sqlInsert);
  } finally {
    connection.close();
  }
}

Future<List<dynamic>> sqlDynamic(String sql) async {
  final connection = await connectToDatabase("127.0.0.1", 3306, "root", "root", "sakila");
  List<dynamic> dbList = [];	
  var result;
   try {
    result = await connection.query(sql);
    dbList.add(result.rows);
  } catch (e) {
    print("Debuging error: ");
    print(e);
  }finally {
    connection.close();
  }
  return dbList;
}

//TODO - get rid of this
List<dynamic> sqlAVS(String sql, MysqlUtils connectionPara) {
  //List<String> dbStringList = [];	
  //MysqlUtils connection;
  List<dynamic> dbList = [];

  var result;
  try {
    connectionPara.startTrans();

    //connection = connectionPara;
    result = connectionPara.query(sql);
    dbList.add(result.rows);

    connectionPara.commit();
    connectionPara.close();

    /*
    result.rows.forEach((row) {
      dbStringList.add(row.toString());
    });
    */

  } catch (e) {
    print("Debuging error: ");
    print(e);
  }
  return dbList;
}

Future<ResultFormat> sqlAutoConn(String sql) async {
  //List<String> dbStringList = [];	
  final connection = await connectToDatabase("127.0.0.1", 3306, "root", "root", "sakila");
  var result;
  try {
    result = await connection.query(sql);
    /*
    result.rows.forEach((row) {
      dbStringList.add(row.toString());
    });
    */
  } catch (e) {
    print("Debuging error: ");
    print(e);
  } finally {
    connection.close();
  }
  return result;
}

/// A function to test the connection to the database by querying for all rows in the "actor" table.
void connectToDatabaseTest() async {
  print("Debuging show results in connectToDatabase method: ");
  //print(results);
  try {
    final conn = await connectToDatabase("127.0.0.1", 3306, "root", "root", "sakila");

    var results = await conn.query("SELECT * FROM actor");

    print("Debuging show results in query: ");
    print(results.rows);
    conn.close();
  }catch (e) {
    print("debuging error: ");
    print(e);
  }
  //print(results);
}
