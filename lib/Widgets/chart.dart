import 'package:flutter/material.dart';

import 'bar.dart';

class Chart extends StatelessWidget {
  final Map<String, int> TaskMap;

  Chart(this.TaskMap);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Container(
        height: 280,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Bar(TaskMap['Monday'] / 10.0, "Mon"),
            Bar(TaskMap['Tuesday'] / 10.0, "Tue"),
            Bar(TaskMap['Wednesday'] / 10.0, "Wed"),
            Bar(TaskMap['Thursday'] / 10.0, "Thu"),
            Bar(TaskMap['Friday'] / 10.0, "Fri"),
            Bar(TaskMap['Saturday'] / 10.0, "Sat"),
            Bar(TaskMap['Sunday'] / 10.0, "Sun"),
          ],
        ),
      ),
    );
    ;
  }
}
