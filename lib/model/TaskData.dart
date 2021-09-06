import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(task: 'Eat'),
    Task(task: 'Code'),
    Task(task: 'Sleep')
  ];

  int get taskCount {
    return _tasks.length;
  }

  UnmodifiableListView<Task> get getTasks {
    return UnmodifiableListView(_tasks);
  }

  void addTask(String task) {
    _tasks.add(Task(task: task));
    notifyListeners();
  }

  void updateTask(int index) {
    _tasks[index].toogleTask();
    notifyListeners();
  }

  void deleteTask(Task task) {
    print(task.task);
    _tasks.remove(task);
    notifyListeners();
  }
}
