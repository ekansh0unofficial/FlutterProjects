 // ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/data/hivedata.dart';
import 'package:todoapp/data/todolist.dart';
import 'package:todoapp/pages/homepage.dart';
import 'package:todoapp/themes/mytheme.dart';

 main() async {

  await Hive.initFlutter();
  Hive.registerAdapter(TodoAdapter());
  var mytodobox = await  Hive.openBox('mytodobox');
  runApp( MainApp());
}

class MainApp extends StatelessWidget {
   const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
    create: (context) => TodoList() , 
    builder: (context , child)=>MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
      theme: MyTheme.lightTheme,
    ),);
  }
} 
