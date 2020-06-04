import 'package:flutter/material.dart';

import 'bar.dart';

class Chart extends StatelessWidget {
  final Map<String, int> TaskMap;
  final double heightOfAppBar;

  Chart(this.TaskMap, this.heightOfAppBar);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Bar(TaskMap['Monday'] / 10.0, "Mon", heightOfAppBar),
            Bar(TaskMap['Tuesday'] / 10.0, "Tue", heightOfAppBar),
            Bar(TaskMap['Wednesday'] / 10.0, "Wed", heightOfAppBar),
            Bar(TaskMap['Thursday'] / 10.0, "Thu", heightOfAppBar),
            Bar(TaskMap['Friday'] / 10.0, "Fri", heightOfAppBar),
            Bar(TaskMap['Saturday'] / 10.0, "Sat", heightOfAppBar),
            Bar(TaskMap['Sunday'] / 10.0, "Sun", heightOfAppBar),
          ],
        ),
      ),
    );
    ;
  }
}
