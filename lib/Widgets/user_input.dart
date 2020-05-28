import 'package:flutter/material.dart';
import 'package:weeklyplanner/Model/TaskModel.dart';
import 'package:weeklyplanner/Widgets/task_list.dart';

class UserInput extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _UserInputState();
  }
}

class _UserInputState extends State<UserInput> {
  List<TaskModel> tasklist = [];

  void _updateTaskList(String name, String day) {
    setState(() {
      tasklist.add(TaskModel(name: name, dayOfWeek: day));
    });
  }

  void _checkSubmitData(String name, String day) {
    if (name != "" && day != "") {
      _updateTaskList(name, day);
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: 500,
            child: TaskList(tasklist),
          ),
        ],
      ),
    );
  }
}
