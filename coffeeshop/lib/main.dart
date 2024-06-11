// ignore_for_file: prefer_const_constructors

import 'package:coffeeshop/pages/introduction.dart';
//import 'package:coffeeshop/pages/homeslide.dart';
import 'package:coffeeshop/pages/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CoffeeModel() , 
      builder:  (context , child ) => MaterialApp(
              debugShowCheckedModeBanner: false,
              
              home: Introduction(),
            ),
      );
  }
}
