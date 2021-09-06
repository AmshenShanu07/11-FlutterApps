import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/model/TaskData.dart';
import 'package:todoey/screens/TaskScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TaskData>(
      create: (context) => TaskData(),
      child: MaterialApp(
        theme: ThemeData(
          primaryTextTheme: TextTheme(
            bodyText2: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        home: TaskScreen(),
      ),
    );
  }
}
