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
  final dayController = TextEditingController();
  final Function _completionHandler;

  _MakeUserInputSheetState(this._completionHandler);

  void _checkSubmitData() {
    if (nameController.text != "" && dayController.text != "") {
      _completionHandler(nameController.text, dayController.text);
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
                child: TextField(
                  controller: dayController,
                  decoration: InputDecoration(labelText: 'Enter the day'),
                  onSubmitted: (_) => _checkSubmitData(),
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
                onPressed: _checkSubmitData,
              )
            ],
          ),
        ),
      ),
    );
  }
}
