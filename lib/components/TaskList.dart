import 'package:flutter/material.dart';
import 'TaskTile.dart';
import 'package:provider/provider.dart';
import 'package:todoey/model/TaskData.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // var taskData = Provider.of<TaskData>(context);
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemCount: taskData.taskCount,
          itemBuilder: (context, index) {
            return TaskTile(
              task: taskData.getTasks[index].task,
              isChecked: taskData.getTasks[index].isChecked,
              onCheck: (val) {
                taskData.updateTask(index);
              },
              longPress: () {
                print('bla');
                taskData.deleteTask(taskData.getTasks[index]);
              },
            );
          },
        );
      },
    );
  }
}
