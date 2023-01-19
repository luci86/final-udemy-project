import 'package:flutter/foundation.dart';
import 'package:state_management_flutter/models/task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {

  List<Task> _tasks = [
    Task('buy bread', false),
    Task('buy milk', false),
    Task('buy eggs', false),
  ];

  UnmodifiableListView<Task>? get tasks {
    if(_tasks!= null)
    return UnmodifiableListView(_tasks);
  }



  int get taskCounter{
    return _tasks.length;
  }

  void addTask(String newTaskTitle) {
    final task=Task(newTaskTitle, false);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}