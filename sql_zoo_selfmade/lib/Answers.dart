// answers.dart
import 'package:flutter/material.dart';
import 'package:mysql_utils/mysql_utils.dart';
import 'package:sql_zoo_selfmade/res/database.dart';
import 'package:sql_zoo_selfmade/res/userData.dart';

//Future<MysqlUtils> connection = connectToDatabase("127.0.0.1", 3306, "root", "root", "sakila");

List<List<dynamic>> correctAnswersFirstPage = [
  
  /*
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
  */

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

List<String> fixedTextsFirstPage = [
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

List<List<dynamic>> correctAnswersSecondPage = [
  
  /*
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
  */

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

List<String> fixedTextsSecondPage = [
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

List<String> userInput = [

];

List<dynamic> sqlDynamicDynamic(String sql,  Future<MysqlUtils> connectionFuture) {
  List<dynamic> dbList = [];
  
  sqlDynamic(sql, connectionFuture).then((result) {
    result.forEach((row) {
      dbList.add(row);
    });
  });

  return dbList;
}

void getUserInput(List<TextEditingController>  controller) {
  for (int i = 0; i < controller.length; i++) {
    userInput.add(controller[0].text);
  }
}

void fillAnwerListFirstPage( Future<MysqlUtils> connectionFuture) {
  for (int i = 0; i < 10; i++) {
    correctAnswersFirstPage.add(sqlDynamicDynamic("SELECT * FROM actor", connectionFuture));
  }
}

bool compare(List<TextEditingController>  controller, int i,  Future<MysqlUtils> connectionFuture) {
  getUserInput(controller);
  fillAnwerListFirstPage(connectionFuture);
  List<dynamic> dd = sqlDynamicDynamic(userInput[i], connectionFuture);
  //connectionFuture.close();
  return dd == correctAnswersFirstPage[i][0];
}