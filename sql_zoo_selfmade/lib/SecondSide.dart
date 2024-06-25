import 'package:flutter/material.dart';
import 'sideBar.dart';
import 'Screens/Login.dart';
import 'textImputList.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Eingabe und prüfung - Seite 2'),
        actions: [
          UserProfileButton(),
        ],
      ),
      drawer: AppDrawer(),
      body: TextInputList(),
    );
  }

}
