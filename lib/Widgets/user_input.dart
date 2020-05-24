import 'package:flutter/material.dart';

class UserInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(labelText: 'Enter the task title'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(labelText: 'Enter the date'),
            ),
          ),
          FlatButton(
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Add Task',
                style: TextStyle(color: Colors.redAccent),
              ),
            ),
          )
        ],
      ),
    );
  }
}
