import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mysql_utils/mysql_utils.dart';
import 'package:sql_zoo_selfmade/Answers.dart';
import 'package:sql_zoo_selfmade/res/database.dart';
import 'package:sql_zoo_selfmade/res/userData.dart';

class TextInputList extends StatefulWidget {
  final List<List<dynamic>> correctAnswers;
  final List<String> fixedTexts;

  TextInputList({required this.correctAnswers, required this.fixedTexts});

  @override
  _TextInputListState createState() => _TextInputListState();
}

class _TextInputListState extends State<TextInputList> {
  final List<TextEditingController> _controllers = List.generate(10, (_) => TextEditingController());
  final List<String?> _results = List.generate(10, (_) => null);
  Future<MysqlUtils>connection = connectToDatabaseFuture("127.0.0.1", 3306, "userApp", "ponkaPieYeeto", "sakila");

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            for (int i = 0; i < 10; i++)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Geben Sie Text ${i + 1} ein:'),
                          SizedBox(height: 2),
                          TextField(
                            controller: _controllers[i],
                            onChanged: (value) => compare(_controllers,i,connection),
                          ),
                          SizedBox(height: 2),
                          Text(
                            widget.fixedTexts[i],
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 2),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            
                           
                            //List wasd = await sqlDynamic(_controllers[i].text); sqlDynamicDynamic(_controllers[i].text) == widget.correctAnswers[i]
                            //List aadwdwa = await widget.correctAnswers[i];
                            //print("debug:");
                            //connection.close();
                            //connectToDatabaseTest();
                            //connection = connectToDatabase("127.0.0.1", 3306, "userApp", "ponkaPieYeeto", "sakila");
                            //userAnswers[i][i] == correctAnswersFirstPage[i][i] userAnswers[0][i] == correctAnswersFirstPage[i][i]
                            _results[i] = listEquals(userAnswers[i], correctAnswersFirstPage[i]) ? 'correct' : 'wrong';
                          });
                        },
                        child: Text('Check'),
                      ),
                    ),
                    SizedBox(width: 2),
                    Expanded(
                      child: _results[i] == null
                          ? Container()
                          : Icon(
                              _results[i] == 'correct' ? Icons.check : Icons.close,
                              color: _results[i] == 'correct' ? Colors.green : Colors.red,
                            ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
