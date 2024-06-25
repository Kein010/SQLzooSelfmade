import 'package:flutter/material.dart';
import 'sideBar.dart';
import 'screens/login.dart';
import 'textImputList.dart';

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
        title: const Text('Text Eingabe und Überprüfung'),
        actions: [
          UserProfileButton(),
        ],
      ),
      drawer: AppDrawer(),
      body: TextInputList(),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Eingabe und Überprüfung - Seite 2'),
        actions: [
          UserProfileButton(),
        ],
      ),
      drawer: AppDrawer(),
      body: TextInputList(),
    );
  }
}
