import 'package:mysql_utils/mysql_utils.dart';

/// Connects to a MySQL database using the provided [host], [port], [user], [password], and [db] parameters.
///
/// The [host] parameter specifies the host address of the MySQL server.
/// The [port] parameter specifies the port number of the MySQL server.
/// The [user] parameter specifies the username for authentication.
/// The [password] parameter specifies the password for authentication.
/// The [db] parameter specifies the name of the database to connect to.
///
/// Returns a [Future] that completes with a [MysqlUtils] instance representing the connection to the database.
///
/// Throws an [Exception] if there is an error connecting to the database.
///
/// The [MysqlUtils] instance returned by this function has the following properties:
/// - [settings]: A map containing the connection settings.
///   - [host]: The host address of the MySQL server.
///   - [port]: The port number of the MySQL server.
///   - [user]: The username for authentication.
///   - [password]: The password for authentication.
///   - [db]: The name of the database to connect to.
///   - [maxConnections]: The maximum number of connections to the database.
///   - [secure]: Whether to use a secure connection.
///   - [prefix]: The prefix for table names.
///   - [pool]: Whether to use connection pooling.
///   - [collation]: The collation for the database.
///   - [sqlEscape]: Whether to escape SQL statements.
///
/// The [MysqlUtils] instance returned by this function also has the following methods:
/// - [errorLog]: A callback function that logs errors.
/// - [sqlLog]: A callback function that logs SQL statements.
/// - [connectInit]: A callback function that is called when the connection is initialized.
MysqlUtils connectToDatabase(String host, int port, String user, String password, String db) {
  var connectionResult = MysqlUtils(
    settings: {
      'host': host,
      'port': port,
      'user': user,
      'password': password,
      'db': db,
      'maxConnections': 10,
      'secure': true,
      'prefix': '',
      'pool': true,
      'collation': 'utf8mb4_general_ci',
      'sqlEscape': true,
    },
    errorLog: (error) {
      print(error);
    },
    sqlLog: (sql) {
      print(sql);
    },
    connectInit: (db1) async {
      print('whenComplete');
    },
  );
  return connectionResult; //TODO add error hanlding where this method is getting called
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

