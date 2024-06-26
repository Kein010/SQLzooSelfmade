import 'package:flutter/material.dart';

class UserProfileButton extends StatefulWidget {
  @override
  _UserProfileButtonState createState() => _UserProfileButtonState();
}
class _UserProfileButtonState extends State<UserProfileButton> {
  bool isLoggedIn = false;
  String username = '';

  void _showLoginDialog() {
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Login'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: usernameController,
                decoration: InputDecoration(labelText: 'Username'),
              ),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Login'),
              onPressed: () {
                setState(() {
                  isLoggedIn = true;
                  username = usernameController.text;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showProfileOptions() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Profile Options'),
          actions: [
            TextButton(
              child: Text('Logout'),
              onPressed: () {
                setState(() {
                  isLoggedIn = false;
                  username = '';
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: CircleAvatar(
        backgroundColor: isLoggedIn ? Colors.blue : Colors.grey,
        child: Text(
          isLoggedIn ? username.substring(0, 2).toUpperCase() : '',
          style: TextStyle(color: Colors.white),
        ),
      ),
      onPressed: () {
        if (isLoggedIn) {
          _showProfileOptions();
        } else {
          _showLoginDialog();
        }
      },
    );
  }
}