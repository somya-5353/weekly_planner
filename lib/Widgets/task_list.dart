import 'package:flutter/material.dart';
import 'package:weeklyplanner/Model/TaskModel.dart';

import 'custom_task.dart';

class TaskList extends StatelessWidget {
  final List<TaskModel> tasklist;
  final String dayOfWeek;
  final Function deletionHandler;

  TaskList(this.tasklist, this.dayOfWeek, this.deletionHandler);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Expanded(
      child: ListView.builder(
        itemCount: tasklist.length,
        itemBuilder: (BuildContext context, int index) {
          return CustomTask(
              taskitem: tasklist[index],
              dayOfWeek: dayOfWeek,
              deletionHandler: deletionHandler);
        },
      ),
    );
  }
}
