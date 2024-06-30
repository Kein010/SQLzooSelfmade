import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mysql_utils/mysql_utils.dart';
import 'package:sql_zoo_selfmade/Answers.dart';
import 'package:sql_zoo_selfmade/res/database.dart';
import 'package:sql_zoo_selfmade/res/userData.dart';
import 'package:sql_zoo_selfmade/screens/user_profile_button.dart';

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
  bool isUserLoggedIn = false;

/// Builds the widget tree for this [BuildContext].
///
/// Returns a [SingleChildScrollView] widget that contains a [Padding] widget
/// with an [EdgeInsets.all] of 8.0. The [Padding] widget contains a [Column]
/// widget with a list of [Row] widgets. Each [Row] widget represents a single
/// text input field with a corresponding check button. The text input field is
/// a [TextField] widget with a label that displays the text 'Geben Sie Text ${i + 1} ein:'.
/// The [TextField] widget has an [onTap] callback that toggles the value of
/// [isUserLoggedIn] based on the result of the [checkLogin] function. The
/// [TextField] widget is controlled by a [TextEditingController] from the
/// [_controllers] list. The [TextField] widget also has a [Text] widget that
/// displays a fixed text from the [widget.fixedTexts] list. The check button
/// is an [ElevatedButton] widget with an [onPressed] callback that calls the
/// [compare] function with the [_controllers] list, the current index [i],
/// and the [connection] Future. The result of the comparison is stored in the
/// [_results] list. If the result is 'correct', an [Icon] widget with the
/// [Icons.check] icon is displayed in green color. If the result is 'wrong',
/// an [Icon] widget with the [Icons.close] icon is displayed in red color.
/// Otherwise, an empty [Container] widget is displayed.
///
/// Returns a [Widget] representing the built widget tree.
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
                          Text('Geben Sie eine Befehl ein ${i + 1} ein:'),
                          SizedBox(height: 2),
                          TextField(
                            //TODO make it actually work
                            /*
                            onTap: () {
                              setState(() {
                                if (checkLogin()) {
                                  isUserLoggedIn = true;
                                }else{
                                  isUserLoggedIn = false;
                                }
                              });
                            },                              
                            */
                            //maxLines: 3,
                            controller: _controllers[i],
                            //readOnly: !isUserLoggedIn, <- this would work if... I am sorry
                            //onChanged: (text) => compare(_controllers,i,connection),
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
                            //TODO make it actually work multiple times
                            //List wasd = await sqlDynamic(_controllers[i].text); sqlDynamicDynamic(_controllers[i].text) == widget.correctAnswers[i]
                            //List aadwdwa = await widget.correctAnswers[i];
                            //print("debug:");
                            //connection.close();
                            //connectToDatabaseTest();
                            //connection = connectToDatabase("127.0.0.1", 3306, "userApp", "ponkaPieYeeto", "sakila");
                            //userAnswers[i][i] == correctAnswersFirstPage[i][i] userAnswers[0][i] == correctAnswersFirstPage[i][i]
                            try {
                              compare(_controllers, i, connection);
                              _results[i] = listEquals(userAnswers[i], correctAnswersFirstPage[i]) ? 'correct' : 'wrong';
                            } catch (e) {
                              print(e);
                            }
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
