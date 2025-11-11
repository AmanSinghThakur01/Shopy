import 'package:flutter/material.dart';

class ToDoProvider with ChangeNotifier {
final List<String> _todos = [];

List<String> get todos=> _todos ;
void addToDo(String task)
{
  if (task.isNotEmpty){
    _todos.add(task);
    notifyListeners();
  }
}
void removeTodo ( int index){
  _todos.removeAt(index);
  notifyListeners();
}

}