import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      routes: {
        '/second': (context) => SecondPage(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Eingabe und Überprüfung'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Eingabe und Überprüfung - Seite 2'),
        actions: [
          UserProfileButton(),
        ],
      ),
      drawer: AppDrawer(),
      body: TextInputList(),
    );
  }
}

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Menü',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
          ),
          ListTile(
            leading: Icon(Icons.pageview),
            title: Text('Seite 2'),
            onTap: () {
              Navigator.pushNamed(context, '/second');
            },
          ),
        ],
      ),
    );
  }
}

class TextInputList extends StatefulWidget {
  @override
  _TextInputListState createState() => _TextInputListState();
}

class _TextInputListState extends State<TextInputList> {
  final List<TextEditingController> _controllers = List.generate(10, (_) => TextEditingController());
  final List<String> _correctAnswers = List.generate(10, (index) => 'Antwort ${index + 1}');
  final List<String?> _results = List.generate(10, (_) => null);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            for (int i = 0; i < 10; i++) 
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0), // Abstand zwischen den Zeilen verringert
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Geben Sie Text ${i + 1} ein:'),
                          SizedBox(height: 2), // Abstand zwischen Text und Textfeld verringert
                          TextField(
                            controller: _controllers[i],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 2), // Abstand zwischen Textfeld und Button verringert
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _results[i] = _controllers[i].text == _correctAnswers[i] ? 'correct' : 'wrong';
                          });
                        },
                        child: Text('Check'),
                      ),
                    ),
                    SizedBox(width: 2), // Abstand zwischen Button und Icon verringert
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

class UserProfileButton extends StatefulWidget {
  @override
  _UserProfileButtonState createState() => _UserProfileButtonState();
}

class _UserProfileButtonState extends State<UserProfileButton> {
  String? _username;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: CircleAvatar(
        backgroundColor: Colors.grey,
        child: _username == null
            ? Text('')
            : Text(
                _username!.substring(0, 2),
                style: TextStyle(color: Colors.white),
              ),
      ),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(_username == null ? 'Anmelden' : 'Abmelden'),
            content: _username == null
                ? TextField(
                    decoration: InputDecoration(labelText: 'Benutzername'),
                    onChanged: (value) {
                      setState(() {
                        _username = value;
                      });
                    },
                  )
                : Text('Möchten Sie sich abmelden?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Abbrechen'),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    if (_username != null) {
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
