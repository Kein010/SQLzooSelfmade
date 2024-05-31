import 'package:mysql1/mysql1.dart';

MySqlConnection connection;

try {
  connection = await MySqlConnection.connect(
    ConnectionSettings(
      host: 'your_host',
      port: your_port,
      user: 'your_user',
      password: 'your_password',
      db: 'your_database',
    ),
  );
} catch (e) {
  print(e);
}

String query = 'SELECT * FROM your_table WHERE your_column LIKE %?%';
List<List<dynamic>> results;

try {
  results = await connection.query(query, ['your_search_term']);
} catch (e) {
  print(e);
}

for (var row in results) {
  // Access the columns using row[column_index]
  // For example: row[0] for the first column