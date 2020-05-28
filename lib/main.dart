import 'package:flutter/material.dart';
import 'package:weeklyplanner/Widgets/LandingScreen.dart';
import './Widgets/user_input.dart';
import 'Model/TaskModel.dart';
import 'Widgets/make_user_input_sheet.dart';

void main() => runApp(MyHome());

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: LandingScreen(),
    );
  }
}
