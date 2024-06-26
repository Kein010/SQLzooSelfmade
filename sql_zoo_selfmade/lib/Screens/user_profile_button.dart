
// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class UserProfileButton extends StatefulWidget {
  const UserProfileButton({super.key});

  @override
  _UserProfileButtonState createState() => _UserProfileButtonState();
}

class _UserProfileButtonState extends State<UserProfileButton> {
  String? _username;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: CircleAvatar(
        backgroundColor: Colors.grey,
        child: _username == null
            ? const Text('')
            : Text(
                _username!.substring(0, 2),
                style: const TextStyle(color: Colors.white),
              ),
      ),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(_username == null ? 'Anmelden' : 'Abmelden'),
            content: _username == null
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: _usernameController,
                        decoration: const InputDecoration(labelText: 'Benutzername'),
                      ),
                      TextField(
                        controller: _passwordController,
                        decoration: const InputDecoration(labelText: 'Passwort'),
                        obscureText: true,
                      ),
                    ],
                  )
                : const Text('Möchten Sie sich abmelden?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Abbrechen'),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    if (_username == null) {
                      if (_usernameController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
                        _username = _usernameController.text;
                        _usernameController.clear();
                        _passwordController.clear();
                      }
                    } else {
                      _username = null;
                    }
                    Navigator.of(context).pop();
                  });
                },
                child: Text(_username == null ? 'Anmelden' : 'Abmelden'),
              ),
            ],
          ),
        );
      },
    );
  }
}