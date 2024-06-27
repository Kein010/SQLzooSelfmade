import 'package:sql_zoo_selfmade/res/database.dart';
import 'package:mysql1/mysql1.dart';

//Todo: check if user entert only one username or password corectly -> give right message
//There is no register. its already in login.
Future <bool> checkIfUserExists(String username, String password) async {

  if (username.isNotEmpty && password.isNotEmpty) {
    final conn = await connectToDatabase("127.0.0.1", 3306, "root", "root", "sakila");
    var result = await conn.query("SELECT * FROM users Where username = username AND password = password", [username, password]);
    if(result.isEmpty) {
      ("INSERT Into users username, password values username, password", [username, password]);
      return false;
    }
  return true;
}
return false;
  // check if username and password are filled
  // handling if string are not filled  
  // check if user exists
  // add user if user does not exist
  // assaign userApp to userDatabase
}

Future <bool> deleteUser(String username) async{
  final conn = await connectToDatabase("127.0.0.1", 3306, "root", "root", "sakila");
var result = await conn.query("DELEATE FROM users Where username = username", [username]);
if (result.affectedRows! > 0) {
  return true;
}
else{
  return false;
}
}

void connectToDatabaseTest() async {
  final conn = await connectToDatabase("127.0.0.1", 3306, "root", "root", "sakila");

  final results = await conn.query("SELECT * FROM actor");

  print("Debuging show results: ");
  print(results);
}
