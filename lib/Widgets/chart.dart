import 'package:flutter/material.dart';

import 'bar.dart';

class Chart extends StatelessWidget {
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
            Bar(0.3, "2013"),
            Bar(0.5, "2014"),
            Bar(0.7, "2015"),
            Bar(0.8, "2016"),
            Bar(0.9, "2017"),
            Bar(0.98, "2018"),
            Bar(0.84, "2019"),
          ],
        ),
      ),
    );
    ;
  }
}
