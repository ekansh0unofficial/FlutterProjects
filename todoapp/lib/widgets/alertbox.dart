// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class MyAlertBox extends StatelessWidget {

  
  late TextEditingController controller;
  Function ()? onSave;
  Function ()? onCancel;

  MyAlertBox({required this.controller , required this.onSave , required this.onCancel});


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
    backgroundColor: Colors.transparent,
    content: Container(
      decoration: BoxDecoration(color: Color.fromARGB(255, 242, 236, 181) , borderRadius: BorderRadius.circular(12)), 
      height: 180,
      width: 300,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
            children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: "Add new task",
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue , width: 2)
                    ),
                  ),  
                  style: TextStyle(color: Colors.black87),
                  controller: controller,

                ),

                SizedBox(height: 22,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(onPressed: onCancel, child: Text("Cancel" , style: TextStyle(color: const Color.fromARGB(255, 78, 59, 3)),)),
                    SizedBox(width: 12,),
                    ElevatedButton(onPressed: onSave, child: Text("Save" , style: TextStyle(color: const Color.fromARGB(255, 219, 164, 0)))),
                  ],
                )
            ],
          ),
      ),
      ),
    );
  }
}