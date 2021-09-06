class Task {
  String task;
  bool isChecked;

  Task({required this.task, this.isChecked: false});

  void toogleTask() {
    this.isChecked = !isChecked;
  }
}
