// answers.dart
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mysql_utils/mysql_utils.dart';
import 'package:sql_zoo_selfmade/res/database.dart';
import 'package:sql_zoo_selfmade/res/userData.dart';

MysqlUtils connection = connectToDatabase("127.0.0.1", 3306, "root", "root", "sakila");

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

final List<String> userInput = [
];

List<dynamic> sqlDynamicDynamic(String sql) {
  //List<dynamic> dbList = [];
 //sqlAVS(sql,connection);

  
/*
  sqlAVS(sql,connection).then((result) {
    for (var row in result) {
      dbList.add(row);
    }
    
  });
*/

  return sqlAVS(sql, connection);
}

List<List<dynamic>> getUserAnswers(List<String> userInput) {
  List<List<dynamic>> dbListList = [];
  dbListList = [sqlDynamicDynamic(userInput[userInput.length - 10]),
  sqlDynamicDynamic(userInput[userInput.length - 9]),
  sqlDynamicDynamic(userInput[userInput.length - 8]),
  sqlDynamicDynamic(userInput[userInput.length - 7]),
  sqlDynamicDynamic(userInput[userInput.length - 6]),
  sqlDynamicDynamic(userInput[userInput.length - 5]),
  sqlDynamicDynamic(userInput[userInput.length - 4]),
  sqlDynamicDynamic(userInput[userInput.length - 3]),
  sqlDynamicDynamic(userInput[userInput.length - 2]),
  sqlDynamicDynamic(userInput[userInput.length - 1]),
  ];
  return dbListList;
}

bool comparison(int i) {
  List list1 = [];
 
 /*
  for (int s = 0; s < userInput.length; s++) {
    list1.add(getUserAnswers(userInput[s]));
  }
  */

  list1.add(getUserAnswers(userInput));


  List list2 = correctAnswersFirstPage;

return listEquals(list1[i], list2[i]);

/*
  if (list1.length != list2.length) {
    return false;
  }
  for (int i = 0; i < list1.length; i++) {
    if (list1[i] != list2[i]) {
      return false;
    }
  }
  return true;
  */
}

void getUserInput(List<TextEditingController> controller) {
  for (int i = 0; i < controller.length; i++) {
    userInput.add(controller[0].text);
  }
}