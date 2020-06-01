import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weeklyplanner/Model/TaskModel.dart';

class CustomTask extends StatelessWidget {
  final TaskModel taskitem;
  final String dayOfWeek;
  final Function deletionHandler;

  CustomTask(
      {@required this.taskitem,
      @required this.dayOfWeek,
      @required this.deletionHandler});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    void _deleteItem() {
      deletionHandler(taskitem.name);
    }

    return Container(
      height: 100,
      child: Card(
        elevation: 5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(10),
                child: CircleAvatar(
                  backgroundColor: Colors.redAccent,
                  radius: 40,
                  child: Text(
                    dayOfWeek.substring(0, 3),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                )),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    taskitem.name,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child: Text(
                      taskitem.dayOfWeek,
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 10,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Container(
              width: 50,
              alignment: Alignment.centerLeft,
              child: FlatButton(
                onPressed: () => _deleteItem(),
                child: new ConstrainedBox(
                  constraints: new BoxConstraints.expand(),
                  child: new Image.asset('assets/images/delete.png',
                      width: 30, height: 30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
