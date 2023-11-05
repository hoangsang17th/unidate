
import 'package:flutter/material.dart';

class UpdateBioScreen extends StatefulWidget {
  @override
  _UpdateBioScreenState createState() => _UpdateBioScreenState();
}

class _UpdateBioScreenState extends State<UpdateBioScreen> {
  String _newBio = '';

  void _saveBio() {
    // TODO: Update user's bio in the database
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Bio'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveBio,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Enter your new bio',
          ),
          onChanged: (value) {
            setState(() {
              _newBio = value;
            });
          },
        ),
      ),
    );
  }
}
