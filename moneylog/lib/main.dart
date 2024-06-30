// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:moneylog/database/log_model.dart';
import 'package:moneylog/homepage.dart';
import 'package:provider/provider.dart';

void main() {
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
      home: Homepage()
      ),
    );
  }
}