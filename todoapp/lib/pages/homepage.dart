// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/data/todolist.dart';
import 'package:todoapp/widgets/alertbox.dart';
import 'package:todoapp/widgets/todotile.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  TextEditingController controller = TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var todoList = Provider.of<TodoList>(context, listen: false);
    if(todoList.mytodobox.get('TODOLIST') == null){todoList.list = [];}
    else{todoList.loadData();}
  }
  
  void newTask(){
    showDialog(
      context: context, 
      builder:(context){return MyAlertBox(controller: controller, onSave: onSave, onCancel: onCancel,);}, 
      );
  }

  void onChange(bool? val , int index){
    setState(() {
      var todoList = Provider.of<TodoList>(context, listen: false);
      todoList.list[index].isCompleted = !todoList.list[index].isCompleted;
      todoList.updateData();
    });
  }

  void onDeleted(int index){
    setState(() {
      var todoList = Provider.of<TodoList>(context, listen: false);
      todoList.removeItem(index);
    });
  }

  void onCancel(){
    controller.clear();
    Navigator.of(context).pop();
  }

   void onSave() {
    setState(() {
      var todoList = Provider.of<TodoList>(context, listen: false);
      var task = controller.text;
      todoList.addItem(task);
      controller.clear();
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    var todoList = Provider.of<TodoList>(context, listen: false);
    return Consumer<TodoList>(
      builder: (context , child , value) => Scaffold(
        backgroundColor: const Color.fromARGB(255, 235, 232, 207),
        appBar: AppBar(
          backgroundColor: Colors.amber[300],
          title: Padding(
            padding: const EdgeInsets.only(left : 16.0),
            child: Text("T O - D O ", style: TextStyle(fontStyle: GoogleFonts.roboto().fontStyle, fontSize: 18, color: Colors.white , fontWeight: FontWeight.bold), ),
          ),
          elevation: 2,
          shadowColor: Colors.yellow,
          ),

        body: Padding(
          padding: EdgeInsets.all(32),
          child: ListView.builder(
            itemCount: todoList.list.length , 
            itemBuilder: (context , index){
                return TodoTile(
                  item: todoList.list[index] , 
                  onChange: (value) => onChange(value , index), 
                  onDeleted: (context)=> onDeleted(index),
                );
            },
          ),
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: ()=> newTask() ,
           child: Icon(CupertinoIcons.add) , 
           backgroundColor: Colors.amber[200],
           shape: CircleBorder(),
        ) 
      )
    );
  }
}