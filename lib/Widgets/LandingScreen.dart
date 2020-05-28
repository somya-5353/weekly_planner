import 'package:flutter/material.dart';
import 'package:weeklyplanner/Model/TaskModel.dart';
import 'package:weeklyplanner/Widgets/task_list.dart';
import 'make_user_input_sheet.dart';

class LandingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LandingScreenState();
  }
}

class _LandingScreenState extends State<LandingScreen> {
  List<TaskModel> tasklist = [];

  void _updateTaskList(String name, String day) {
    setState(() {
      tasklist.add(TaskModel(name: name, dayOfWeek: day));
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "Weekly Planner",
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Weekly Planner'),
        ),
        body: SingleChildScrollView(
          child: Container(
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
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 500,
                          child: TaskList(tasklist),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => MakeUserInputSheet(_updateTaskList),
            );
          },
        ),
      ),
    );
  }
}
