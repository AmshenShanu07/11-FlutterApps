import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/model/TaskData.dart';

// ignore: must_be_immutable
class AddTask extends StatelessWidget {
  String task = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Add Todo',
              style: TextStyle(
                fontSize: 22,
                color: Colors.lightBlueAccent,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextField(
              autofocus: true,
              decoration: InputDecoration(
                focusColor: Colors.lightBlueAccent,
              ),
              onChanged: (val) {
                task = val;
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {
                Provider.of<TaskData>(context, listen: false).addTask(task);
                task = '';
                Navigator.pop(context);
              },
              child: Text(
                'ADD',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              style: TextButton.styleFrom(
                  backgroundColor: Colors.lightBlueAccent,
                  padding: EdgeInsets.symmetric(horizontal: 50)),
            ),
          ],
        ),
        padding: EdgeInsets.all(30),
        constraints: BoxConstraints(minHeight: 200),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
      ),
    );
  }
}
