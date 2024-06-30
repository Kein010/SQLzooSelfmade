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
  'Schriebe einen SELECT Befehl um die actor_id Spalte ausgegeben zu lassen.',
  'Schriebe einen SELECT Befehl um die actor_id und die name Spalte ausgegeben zu lassen. ',
  'Schreibe einen SELECT-Befehl, um alle Mitarbeiter aus der Tabelle staff auszugeben, die den Nachnamen ALLLEN haben.',
  'Schreibe einen SELECT-Befehl, um alle Einträge der Tabelle payment auszugeben und diese nach dem Gehalt (amount) absteigend zu sortieren. ',
  'Schreibe einen SELECT-Befehl, um alle Filme (film) aus der Tabelle film auszugeben, die aus der Kategorie /''Action/'' stammen und sortiere die Ergebnisse nach dem Titel (title) in aufsteigender Reihenfolge.',
  'Schreibe einen DELETE-Befehl, um alle Kunden (customer) aus der Tabelle customer zu löschen, deren Nachname /''Smith/'' ist.',
  'Schreibe einen INSERT INTO-Befehl, um einen neuen Film (film) in die Tabelle film einzufügen. Der Titel des Films soll /''New Action Movie/'' sein, die Beschreibung soll /''An exciting new action movie/'' lauten, und er soll in der Kategorie /''Action/'' sein.',
  'Schreibe einen DELETE-Befehl, um den Film mit dem Titel /''Old Movie/'' aus der Tabelle film zu löschen, und einen INSERT INTO-Befehl, um einen neuen Film mit dem Titel /''Jurassic Park 10/'', der Beschreibung /''An updated version of the classic/'', und der Kategorie /''Drama/'' in die Tabelle film einzufügen. ',
  'Schreibe einen SELECT-Befehl, der die Titel aller Filme (film) und die Namen der Kategorien (category) anzeigt, zu denen sie gehören.',
  'Schreibe einen SELECT-Befehl, der alle Kundennamen (customer) und die Titel der Filme (film) anzeigt, die sie ausgeliehen haben. Zeige auch Kunden an, die keine Filme ausgeliehen haben.',
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
    userInput.clear();
    userInput.add(controller[i].text);
  }
}

void fillAnwerListFirstPage(Future<MysqlUtils> connectionFuture) async{
  List<List<String>> dbList = [];
  
  for (int i = 0; i < 10; i++) {
    dbList.add(await (sqlDynamic("SELECT * FROM actor", connectionFuture)));
    resetDatabase();
  }
  correctAnswersFirstPage.clear();
  correctAnswersFirstPage.addAll(dbList);
  //return true;
}

void fillUserAnwerList(Future<MysqlUtils> connectionFuture) async{
  List<List<String>> dbList = [];
  
  for (int i = 0; i < userInput.length; i++) {
    dbList.add(await (sqlDynamic(userInput[i], connectionFuture)));
    resetDatabase();
  }

  userAnswers.clear();
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
