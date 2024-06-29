// answers.dart
import 'dart:js_interop';

import 'package:mysql_utils/mysql_utils.dart';
import 'package:sql_zoo_selfmade/res/database.dart';
import 'package:sql_zoo_selfmade/res/userData.dart';

//Future<MysqlUtils> connection = connectToDatabase("127.0.0.1", 3306, "root", "root", "sakila");

final List<List<dynamic>> correctAnswersFirstPage = [
  
  
  sqlDynamicDynamic("SELECT * FROM actor"),  
  sqlDynamicDynamic("SELECT * FROM actor"),
  sqlDynamicDynamic("SELECT * FROM actor"),
  sqlDynamicDynamic("SELECT * FROM actor"),
  sqlDynamicDynamic("SELECT * FROM actor"),
  sqlDynamicDynamic("SELECT * FROM actor"),
  sqlDynamicDynamic("SELECT * FROM actor"),
  sqlDynamicDynamic("SELECT * FROM actor"),
  sqlDynamicDynamic("SELECT * FROM actor"),
  sqlDynamicDynamic("SELECT * FROM actor"),
  
  /*
  'Antwort 1.1',
  'Antwort 2.1',
  'Antwort 3.1',
  'Antwort 4.1',
  'Antwort 5.1',
  'Antwort 6.1',
  'Antwort 7.1',
  'Antwort 8.1',
  'Antwort 9.1',
  'Antwort 10.1',
  */

];

final List<String> fixedTextsFirstPage = [
  'Fester Text 1.1',
  'Fester Text 2.1',
  'Fester Text 3.1',
  'Fester Text 4.1',
  'Fester Text 5.1',
  'Fester Text 6.1',
  'Fester Text 7.1',
  'Fester Text 8.1',
  'Fester Text 9.1',
  'Fester Text 10.1',
];

final List<List<dynamic>> correctAnswersSecondPage = [
  
  
  sqlDynamicDynamic("SELECT * FROM actor"),  
  sqlDynamicDynamic("SELECT * FROM actor"),
  sqlDynamicDynamic("SELECT * FROM actor"),
  sqlDynamicDynamic("SELECT * FROM actor"),
  sqlDynamicDynamic("SELECT * FROM actor"),
  sqlDynamicDynamic("SELECT * FROM actor"),
  sqlDynamicDynamic("SELECT * FROM actor"),
  sqlDynamicDynamic("SELECT * FROM actor"),
  sqlDynamicDynamic("SELECT * FROM actor"),
  sqlDynamicDynamic("SELECT * FROM actor"),

  /*
  sql("SELECT * FROM actor", connection),  
  sql("SELECT * FROM actor", connection),
  sql("SELECT * FROM actor", connection),
  sql("SELECT * FROM actor", connection),
  sql("SELECT * FROM actor", connection),
  sql("SELECT * FROM actor", connection),
  sql("SELECT * FROM actor", connection),
  sql("SELECT * FROM actor", connection),
  sql("SELECT * FROM actor", connection),
  sql("SELECT * FROM actor", connection),
  */

  /*
  'Antwort 1.2',
  'Antwort 2.2',
  'Antwort 3.2',
  'Antwort 4.2',
  'Antwort 5.2',
  'Antwort 6.2',
  'Antwort 7.2',
  'Antwort 8.2',
  'Antwort 9.2',
  'Antwort 10.2',
  */
];

final List<String> fixedTextsSecondPage = [
  'Fester Text 1.2',
  'Fester Text 2.2',
  'Fester Text 3.2',
  'Fester Text 4.2',
  'Fester Text 5.2',
  'Fester Text 6.2',
  'Fester Text 7.2',
  'Fester Text 8.2',
  'Fester Text 9.2',
  'Fester Text 10.2',
];

List<dynamic> sqlDynamicDynamic(String sql) {
  List<dynamic> dbList = [];
  
  sqlDynamic(sql).then((result) {
    result.forEach((row) {
      dbList.add(row);
    });
  });

  return dbList;
}