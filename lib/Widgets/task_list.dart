import 'package:flutter/material.dart';
import 'package:weeklyplanner/Model/TaskModel.dart';

class TaskList extends StatefulWidget {
  final List<TaskModel> tasklist;

  TaskList(this.tasklist);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CreateTaskList();
  }
}

class _CreateTaskList extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}
