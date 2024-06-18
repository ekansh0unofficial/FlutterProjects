import 'package:flutter/material.dart';
import 'package:hive/hive.dart';


@HiveType(typeId: 0)
class Todo extends HiveObject{

  @HiveField(0)
  String task;
  @HiveField(1)
  bool isCompleted;


  Todo({ required this.task , required this.isCompleted });
}

class TodoList extends ChangeNotifier{

  final mytodobox = Hive.box('mytodobox');

  
  void loadData(){
    list = mytodobox.get('TODOLIST', defaultValue: <Todo>[]).cast<Todo>();
  }

  void updateData(){
    mytodobox.put('TODOLIST' , list);
  }

  

  List<Todo> list = [];

  void addItem(String task){
    list.add(Todo(task: task , isCompleted: false));
    updateData();
    notifyListeners();
  }

  void removeItem(int index){
    list.removeAt(index);
    updateData();
    notifyListeners();
  }

}