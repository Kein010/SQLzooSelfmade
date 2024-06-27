import 'package:flutter/material.dart';


class TextInputList extends StatefulWidget {
  final List<String> correctAnswers;
  final List<String> fixedTexts;

  TextInputList({required this.correctAnswers, required this.fixedTexts});

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
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Geben Sie Text ${i + 1} ein:'),
                          SizedBox(height: 2),
                          TextField(
                            controller: _controllers[i],
                          ),
                          SizedBox(height: 2),
                          Text(
                            widget.fixedTexts[i],
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 2),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _results[i] = _controllers[i].text == widget.correctAnswers[i] ? 'correct' : 'wrong';
                          });
                        },
                        child: Text('Check'),
                      ),
                    ),
                    SizedBox(width: 2),
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
