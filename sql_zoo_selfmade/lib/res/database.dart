import 'package:mysql1/mysql1.dart';
import 'dart:io';

Future<MySqlConnection> connectToDatabase(String host, int port, String user, String password, String db) async {
final connectionResult = await MySqlConnection.connect(
  ConnectionSettings(
    host: host,//your_localhost
    port: port,//your_port
    user: user,//your_user
    password: password,//your_password
    db: db,//your_database
  ),
);
  return connectionResult; //TODO add error hanlding where this method is getting called
}


// ungetestet aber sont alles da  um

Future resetDatabase(String host, int port, String user, String password, String db, String query) async {
  // Verbindung zur Datenbank herstellen
  final connection = await connectToDatabase(host, port, user, password, db);
  try {

      String sqlInsert = await File('InsertData.sql').readAsString();
      
      // SQL-Befehl ausführen
      await connection.query(sqlInsert);
  } finally {
    // Verbindung schließen
    await connection.close();
  }
}


// await connection.query('SELECT * FROM your_table');

// String query = 'SELECT * FROM your_table WHERE your_column LIKE %?%';
// List<List<dynamic>> results;

// try {
//   results = await connection.query(query, ['your_search_term']);
// } catch (e) {
//   print(e);
// }

// for (var row in results) {
//   // Access the columns using row[column_index]
//   // For example: row[0] for the first column
//   }

