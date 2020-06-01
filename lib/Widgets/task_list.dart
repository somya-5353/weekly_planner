import 'package:flutter/material.dart';
import 'package:weeklyplanner/Model/TaskModel.dart';

import 'custom_task.dart';

class TaskList extends StatelessWidget {
  final List<TaskModel> tasklist;
  final String dayOfWeek;
  TaskList(this.tasklist, this.dayOfWeek);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
      itemCount: tasklist.length,
      itemBuilder: (BuildContext context, int index) {
        return CustomTask(taskitem: tasklist[index], dayOfWeek: dayOfWeek);
      },
    );
  }
}
