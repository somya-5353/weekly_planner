import 'package:flutter/material.dart';
import 'package:weeklyplanner/Model/TaskModel.dart';
import 'package:weeklyplanner/Widgets/task_list.dart';
import 'chart.dart';
import 'make_user_input_sheet.dart';

class LandingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LandingScreenState();
  }
}

class _LandingScreenState extends State<LandingScreen> {
  List<TaskModel> tasklist = [];
  var daySelected = 'Monday';
  var taskMap = {
    'Monday': 0,
    'Tuesday': 0,
    'Wednesday': 0,
    'Thursday': 0,
    'Friday': 0,
    'Saturday': 0,
    'Sunday': 0
  };

  void _populateChart() {
    for (TaskModel task in tasklist) {
      if (task.dayOfWeek == 'Monday') {
        var val = taskMap['Monday'];
        val = val + 1;
        taskMap['Monday'] = val;
      }
      if (task.dayOfWeek == 'Tuesday') {
        var val = taskMap['Tuesday'];
        val = val + 1;
        taskMap['Tuesday'] = val;
      }
      if (task.dayOfWeek == 'Wednesday') {
        var val = taskMap['Wednesday'];
        val = val + 1;
        taskMap['Wednesday'] = val;
      }
      if (task.dayOfWeek == 'Thursday') {
        var val = taskMap['Thursday'];
        val = val + 1;
        taskMap['Thursday'] = val;
      }
      if (task.dayOfWeek == 'Friday') {
        var val = taskMap['Friday'];
        val = val + 1;
        taskMap['Friday'] = val;
      }
      if (task.dayOfWeek == 'Saturday') {
        var val = taskMap['Saturday'];
        val = val + 1;
        taskMap['Saturday'] = val;
      }
      if (task.dayOfWeek == 'Sunday') {
        var val = taskMap['Sunday'];
        val = val + 1;
        taskMap['Sunday'] = val;
      }
    }
  }

  void _updateTaskList(String name, String day) {
    setState(() {
      tasklist.add(TaskModel(name: name, dayOfWeek: day));
      daySelected = day;
      _populateChart();
    });
  }

  void deleteItem(String name) {
    setState(() {
      tasklist.removeWhere((tx) {
        return tx.name == name;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "Weekly Planner",
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Weekly Planner'),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(20),
                  child: Card(
                    elevation: 5,
                    child: Chart(taskMap),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        tasklist.length == 0
                            ? Container(
                                height: 500,
                                child: Column(
                                  children: <Widget>[
                                    Center(
                                      child: new Image.asset(
                                          'assets/images/nothing.png',
                                          width: 200,
                                          height: 200),
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(20),
                                      padding: EdgeInsets.all(20),
                                      child: Text(
                                        'There are no plans listed!',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            : Container(
                                height: 500,
                                child:
                                    TaskList(tasklist, daySelected, deleteItem),
                              ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => MakeUserInputSheet(_updateTaskList),
            );
          },
        ),
      ),
    );
  }
}
