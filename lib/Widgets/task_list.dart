import 'package:flutter/material.dart';
import 'package:weeklyplanner/Model/TaskModel.dart';

import 'custom_task.dart';

class TaskList extends StatelessWidget {
  final List<TaskModel> tasklist;
  TaskList(this.tasklist);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
      itemCount: tasklist.length,
      itemBuilder: (BuildContext context, int index) {
        return CustomTask(taskitem: tasklist[index]);
      },
    );
  }
}
