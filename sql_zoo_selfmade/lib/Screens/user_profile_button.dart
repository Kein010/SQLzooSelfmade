import 'package:flutter/material.dart';
import 'package:sql_zoo_selfmade/res/userData.dart';

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
    //String name = usernameController.text;
    //String password = passwordController.text;

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
                decoration: InputDecoration(labelText: 'Email(Dommy)'),
              ),
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
              child: Text('Deleate Account'), 
              onPressed: () async{
                bool result = await deleteUser(usernameController.text);
                if(result)
                {
                
                  //message:  Erfolgreichgelöscht 
                }
                else{
                  //message:  konnte nicht gelöscht werden
                }
              },
            ),
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Login'),
              onPressed: () async {
                connectToDatabaseTest();
                bool test = await checkIfUserExists(usernameController.text, passwordController.text);

                if(test)
                {
                  //messeage: user Angemeldet oder neu erstellt
                }
                else{
                  //message: nicht alle daten daten angegeben.
                }

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
          isLoggedIn ? username.substring(0, 2).toUpperCase() : '', //TODO catch error when no input
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