// answers.dart
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mysql_utils/mysql_utils.dart';
import 'package:sql_zoo_selfmade/res/database.dart';
import 'package:sql_zoo_selfmade/res/userData.dart';

//Future<MysqlUtils> connection = connectToDatabase("127.0.0.1", 3306, "root", "root", "sakila");

List<List<String>> correctAnswersFirstPage = [
  
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

List<List<String>> userAnswers = [
  
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

List<String> testStrings = [
  'Test 1.1',
  'Test 2.1',
  'Test 3.1',
  'Test 4.1',
  'Test 5.1',
  'Test 6.1',
  'Test 7.1',
  'Test 8.1',
  'Test 9.1',
  'Test 10.1',
];

List<String> sqlDynamicDynamic(String sql,  Future<MysqlUtils> connectionFuture) {
  List<String> dbList = [];
  //List<Future<List<String>>> dbListFuture = [sqlDynamic(sql, connectionFuture)];

  
  //Future<List<String>> dbListFuture2 = dbListFuture[i];

  //dbListFuture.add(sqlDynamic(sql, connectionFuture));
  sqlDynamic(sql, connectionFuture).then((result) {
    for (var row in result) {
      dbList.add(row);
    }
  });

  return dbList;
}

void getUserInput(List<TextEditingController>  controller) {
  for (int i = 0; i < controller.length; i++) {
    userInput.add(controller[i].text);
  }
}

void fillAnwerListFirstPage(Future<MysqlUtils> connectionFuture) async{
  List<List<String>> dbList = [];
  
  for (int i = 0; i < 10; i++) {
    dbList.add(await (sqlDynamic("SELECT * FROM actor", connectionFuture)));
  }
  correctAnswersFirstPage.addAll(dbList);
  //return true;
}

void fillUserAnwerList(Future<MysqlUtils> connectionFuture) async{
  List<List<String>> dbList = [];
  
  for (int i = 0; i < 10; i++) {
    dbList.add(await (sqlDynamic(userInput[i], connectionFuture)));

  }
  userAnswers.addAll(dbList);
  //return true;
}

void compare(List<TextEditingController>  controller, int i,  Future<MysqlUtils> connectionFuture){
  getUserInput(controller);
 
  //correctAnswersFirstPage.add(testStrings);
  //userAnswers.add(userInput);
  /*
 if (await fillAnwerListFirstPage(connectionFuture) && await fillUserAnwerList(connectionFuture)) {
   return true;
 }else {
   return false;
 }
 */
  fillAnwerListFirstPage(connectionFuture);
  fillUserAnwerList(connectionFuture);
//for (int s = 0; s < 10; s++) {
  //int s = 0 + i;
  //if () {
  //}

 // return true;
/*
try {
  return listEquals(userAnswers[i], correctAnswersFirstPage[i]);
} catch (e) {
  print(e);
  return false;
  
}
*/

}
/*
  try {
    return userAnswers[i][i] == correctAnswersFirstPage[i][i];
  }catch (e) {
    print(e);
    return false;
  }
  */
