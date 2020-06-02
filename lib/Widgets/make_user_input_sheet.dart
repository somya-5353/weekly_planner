import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MakeUserInputSheet extends StatefulWidget {
  final Function _completionHandler;

  MakeUserInputSheet(this._completionHandler);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MakeUserInputSheetState(_completionHandler);
  }
}

class _MakeUserInputSheetState extends State<MakeUserInputSheet> {
  final nameController = TextEditingController();
  final Function _completionHandler;

  String _chosenValue = 'Monday';

  _MakeUserInputSheetState(this._completionHandler);

  void _checkSubmitData() {
    if (nameController.text != "") {
      _completionHandler(nameController.text, _chosenValue);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      child: Container(
        height: 700,
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration:
                      InputDecoration(labelText: 'Enter the task title'),
                  controller: nameController,
                  onSubmitted: (_) => _checkSubmitData(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton<String>(
                  value: _chosenValue,
                  items: <String>[
                    'Monday',
                    'Tuesday',
                    'Wednesday',
                    'Thursday',
                    'Friday',
                    'Saturday',
                    'Sunday'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String value) {
                    setState(() {
                      _chosenValue = value;
                    });
                  },
                ),
              ),
              FlatButton(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Add Task',
                    style: TextStyle(color: Colors.deepOrange, fontSize: 15),
                  ),
                ),
                onPressed: _checkSubmitData,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
