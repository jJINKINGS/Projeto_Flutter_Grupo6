import 'package:flutter/material.dart';
import 'package:to_do/model/task.dart';

class TaskProvider with ChangeNotifier {
  List<String> tasks = []; 

  void addTask(String task) {
    tasks.add(task);
    notifyListeners(); 

  void removeTask(int index) {
    tasks.removeAt(index); 
    notifyListeners();
  }
}
