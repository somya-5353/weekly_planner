import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weeklyplanner/Model/TaskModel.dart';

class CustomTask extends StatelessWidget {
  final TaskModel taskitem;

  CustomTask({@required this.taskitem});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.redAccent,
              ),
            ),
            Column(
              children: <Widget>[
                Text(taskitem.name),
                Text(taskitem.dayOfWeek),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
