// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:money_log_1/navigation/routes.dart';
import 'package:money_log_1/pages/createrspage.dart';
import 'package:money_log_1/pages/helppage.dart';
import 'database/log_model.g.dart';
import 'database/logsheet_model.g.dart';
import 'package:provider/provider.dart';
import 'database/log_model.dart';
import 'pages/homepage.dart';

void main() async {
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(0)) {
    Hive.registerAdapter(LogAdapter());
  }
  if (!Hive.isAdapterRegistered(1)) {
    Hive.registerAdapter(LogSheetAdapter());
  }

  var logbox = await Hive.openBox('logsheet');
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
    create: (context) => LogBook(),
    builder: (context, child) => MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
      routes: {
        MyRoutes.homeRoute : (context) => Homepage(),
        MyRoutes.helpRoute : (context) => HelpPage(),
        MyRoutes.createrRoute  : (context) => CreatersPage(),
      },
      ),
    );
  }
}