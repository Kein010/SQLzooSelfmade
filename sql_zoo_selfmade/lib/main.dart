import 'package:flutter/material.dart';
import 'Screens/Login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text Eingabe Beispiel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  final List<TextEditingController> controllers = List.generate(10, (_) => TextEditingController());
  final List<String> displayTexts = List.generate(10, (_) => '');

  void updateText(int index) {
    setState(() {
      displayTexts[index] = controllers[index].text;
    });
  }

  bool isCorrect(String text) {
    // Beispiel für korrekten Text. Passen Sie dies nach Bedarf an.
    return text == 'Flutter';
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Eingabe Beispiel'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
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
              title: Text('Startseite'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.navigate_next),
              title: Text('Weitere Seite'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Bitte Text eingeben:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Eingabe ${index + 1}:',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: TextField(
                                controller: controllers[index],
                                decoration: InputDecoration(labelText: 'Eingabe ${index + 1}'),
                              ),
                            ),
                            SizedBox(width: 8),
                            ElevatedButton(
                              onPressed: () => updateText(index),
                              child: Text('Aktualisieren'),
                            ),
                            SizedBox(width: 8),
                            if (displayTexts[index].isNotEmpty)
                              Icon(
                                isCorrect(displayTexts[index]) ? Icons.check : Icons.close,
                                color: isCorrect(displayTexts[index]) ? Colors.green : Colors.red,
                              )
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


