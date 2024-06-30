import 'package:flutter/material.dart';
import 'side_bar.dart';
import 'answers.dart';
import 'Screens/user_profile_button.dart';
import 'text_imput_list.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
        actions: [UserProfileButton()],
      ),
      drawer: AppDrawer(),
      body: TextInputList(
        correctAnswers: correctAnswersSecondPage,
        fixedTexts: fixedTextsSecondPage,
      ),
      
    );
    
  }
}
