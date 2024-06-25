// text_input_list.dart
import 'package:flutter/material.dart';
import 'Answers.dart';

class TextInputList extends StatefulWidget {
  @override
  _TextInputListState createState() => _TextInputListState();
}

class _TextInputListState extends State<TextInputList> {
  final List<TextEditingController> _controllers = List.generate(10, (_) => TextEditingController());
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
                            _results[i] = _controllers[i].text == correctAnswers[i] ? 'correct' : 'wrong';
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
