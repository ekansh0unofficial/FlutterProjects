// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoapp/data/todolist.dart';

class TodoTile extends StatelessWidget {
   
  TodoTile({super.key  , required this.item , required this.onChange, required this.onDeleted});
  Todo item; 
  void Function(bool?)? onChange;
  void Function(BuildContext)? onDeleted;

  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: ScrollMotion(), 
          children: [
              SlidableAction(
                onPressed: onDeleted , 
                icon: Icons.delete,
                backgroundColor: Color.fromARGB(255, 238, 215, 10),
                borderRadius: BorderRadius.circular(12),
                autoClose: true,
              )
          ]
        ),
        child: Container(
          padding: EdgeInsets.all(16),
          color: Color.fromARGB(158, 255, 239, 98),
          child: Row(
            children: [
              Checkbox(value: item.isCompleted, onChanged: onChange, activeColor: Colors.black, ),
              SizedBox(width: 4,),
              Text(item.task , style: TextStyle(fontStyle: GoogleFonts.roboto().fontStyle , decoration: item.isCompleted? TextDecoration.lineThrough : TextDecoration.none , fontSize: 16),),
            ],
          )
        ),
      ),
    );
  }
}