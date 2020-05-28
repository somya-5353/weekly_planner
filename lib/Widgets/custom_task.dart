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
      height: 70,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 50,
              width: 50,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.orangeAccent),
                shape: BoxShape.circle,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
