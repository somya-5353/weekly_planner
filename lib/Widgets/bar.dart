import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class Bar extends StatelessWidget {
  final double height;
  final String label;
  final double heightOfAppBar;

  final int _baseDurationMs = 1000;
  final double _maxElementHeight = 180;

  Bar(this.height, this.label, this.heightOfAppBar);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CustomAnimation(
      duration: Duration(milliseconds: (height * _baseDurationMs).round()),
      tween: Tween(begin: 0.0, end: height),
      builder: (context, widget, animatedHeight) {
        return Column(
          children: <Widget>[
            Container(
              height: (1 - animatedHeight) *
                  (((MediaQuery.of(context).size.height -
                              heightOfAppBar -
                              MediaQuery.of(context).padding.top) *
                          0.4) *
                      0.5),
            ),
            Container(
              width: 20,
              height: animatedHeight *
                  (((MediaQuery.of(context).size.height -
                              heightOfAppBar -
                              MediaQuery.of(context).padding.top) *
                          0.4) *
                      0.3),
              color: Colors.redAccent,
            ),
            Text(label)
          ],
        );
      },
    );
    ;
  }
}
