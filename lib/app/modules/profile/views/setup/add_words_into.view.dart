
import 'package:flutter/material.dart';

class AddWordsIntoView extends StatefulWidget {
  @override
  _AddWordsIntoViewState createState() => _AddWordsIntoViewState();
}

class _AddWordsIntoViewState extends State<AddWordsIntoView> {
  List<String> _words = [
    'Word 1',
    'Word 2',
    'Word 3',
    'Word 4',
    'Word 5',
    'Word 6',
    'Word 7',
    'Word 8',
    'Word 9',
    'Word 10',
  ];

  List<String> _selectedWords = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pick Words'),
      ),
      body: ListView.builder(
        itemCount: _words.length,
        itemBuilder: (BuildContext context, int index) {
          final word = _words[index];
          return ListTile(
            title: Text(word),
            trailing: _selectedWords.contains(word)
                ? Icon(Icons.check_box)
                : Icon(Icons.check_box_outline_blank),
            onTap: () {
              setState(() {
                if (_selectedWords.contains(word)) {
                  _selectedWords.remove(word);
                } else {
                  _selectedWords.add(word);
                }
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Do something with the selected words
          print(_selectedWords);
        },
        child: Icon(Icons.check),
      ),
    );
  }
}
