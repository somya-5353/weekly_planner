import 'package:flutter/material.dart';
import './Widgets/user_input.dart';
import 'Model/TaskModel.dart';
import 'Widgets/make_user_input_sheet.dart';

void main() => runApp(MyHome());

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  List<TaskModel> tasklist = [];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Weekly Planner'),
          backgroundColor: Colors.redAccent,
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: 300,
                padding: EdgeInsets.all(20),
                child: Card(
                  color: Colors.teal,
                  child: Text("Card"),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: UserInput(),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => Container(
                child: MakeUserInputSheet(),
              ),
            );
          },
        ),
      ),
    );
  }
}
