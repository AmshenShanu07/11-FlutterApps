import 'dart:ffi';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TaskTile extends StatelessWidget {
  final String task;
  final bool isChecked;
  var onCheck;
  final Function longPress;
  TaskTile({
    required this.task,
    required this.isChecked,
    required this.onCheck,
    required this.longPress,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: () => longPress(),
      title: Text(
        task,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          decoration: isChecked ? TextDecoration.lineThrough : null,
          decorationThickness: 2,
        ),
      ),
      trailing: Checkbox(
        onChanged: onCheck,
        value: isChecked,
        activeColor: Colors.lightBlueAccent,
      ),
    );
  }
}
