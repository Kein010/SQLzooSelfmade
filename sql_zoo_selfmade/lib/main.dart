import 'package:flutter/material.dart';
import 'side_bar.dart';
import 'answers.dart';
import 'screens/user_profile_button.dart';
import 'text_imput_list.dart';
import 'second_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
      routes: {
        '/second': (context) => SecondPage(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Page'),
        actions: [UserProfileButton()],
      ),
      drawer: AppDrawer(),
      body: TextInputList(
        correctAnswers: correctAnswersFirstPage,
        fixedTexts: fixedTextsFirstPage,
      ),
    );
  }
}

