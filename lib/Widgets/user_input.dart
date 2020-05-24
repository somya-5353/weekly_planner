import 'package:flutter/material.dart';
import 'package:weeklyplanner/Model/TaskModel.dart';
import 'package:weeklyplanner/Widgets/task_list.dart';

//adding a comment

class UserInput extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _UserInputState();
  }
}

class _UserInputState extends State<UserInput> {
  List<TaskModel> tasklist = [];
  final nameController = TextEditingController();
  final dayController = TextEditingController();

  void _updateTaskList() {
    setState(() {
      tasklist.add(
          TaskModel(name: nameController.text, dayOfWeek: dayController.text));
      nameController.text = '';
      dayController.text = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration:
                          InputDecoration(labelText: 'Enter the task title'),
                      controller: nameController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: dayController,
                      decoration: InputDecoration(labelText: 'Enter the day'),
                    ),
                  ),
                  FlatButton(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Add Task',
                        style: TextStyle(color: Colors.redAccent),
                      ),
                    ),
                    onPressed: _updateTaskList,
                  )
                ],
              ),
            ),
          ),
          Container(
            height: 500,
            child: TaskList(tasklist),
          ),
        ],
      ),
    );
  }
}
