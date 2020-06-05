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

  bool _showBarGraph = false;

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
    final app = AppBar(
      title: Text('Weekly Planner'),
    );

    final double heightOfAppBar = app.preferredSize.height;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    final taskdisplay = tasklist.length == 0
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Container(
              child: Column(
                children: <Widget>[
                  Container(
                    child: Center(
                      child: new Image.asset(
                        'assets/images/nothing.png',
                        height: (MediaQuery.of(context).size.height -
                                app.preferredSize.height -
                                MediaQuery.of(context).padding.top) *
                            0.25,
                        width: 150,
                      ),
                    ),
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
            );
          })
        : Container(
            child: TaskList(tasklist, daySelected, deleteItem),
          );

    // TODO: implement build
    return new MaterialApp(
      title: "Weekly Planner",
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: Scaffold(
        appBar: app,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                if (isLandscape)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Display Bar Graph'),
                      Switch(
                        value: _showBarGraph,
                        onChanged: (val) {
                          setState(() {
                            _showBarGraph = val;
                            print(_showBarGraph);
                          });
                        },
                      ),
                    ],
                  ),
                if (!isLandscape)
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Card(
                      elevation: 5,
                      child: Chart(taskMap, heightOfAppBar),
                    ),
                  ),
                if (!isLandscape)
                  Container(
                    height: (MediaQuery.of(context).size.height -
                            app.preferredSize.height -
                            MediaQuery.of(context).padding.top) *
                        0.5,
                    padding: EdgeInsets.all(20),
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          taskdisplay,
                        ],
                      ),
                    ),
                  ),
                if (isLandscape)
                  _showBarGraph
                      ? Container(
                          padding: EdgeInsets.fromLTRB(20, 20, 50, 20),
                          child: Card(
                            elevation: 5,
                            child: Chart(taskMap, heightOfAppBar),
                          ),
                        )
                      : Container(
                          height: (MediaQuery.of(context).size.height -
                                  app.preferredSize.height -
                                  MediaQuery.of(context).padding.top) *
                              0.7,
                          padding: EdgeInsets.all(20),
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                taskdisplay,
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
