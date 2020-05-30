import 'dart:ui';

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
              padding: EdgeInsets.fromLTRB(20, 10, 100, 10),
              margin: EdgeInsets.fromLTRB(20, 0, 40, 0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.redAccent,
                  width: 2.0,
                ),
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(85, 5, 5, 5),
                child: new Text(
                  'hello',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  taskitem.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Text(
                  taskitem.dayOfWeek,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 10,
                    color: Colors.redAccent,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
