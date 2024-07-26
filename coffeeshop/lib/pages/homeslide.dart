// ignore_for_file: prefer_const_constructors

import 'package:coffeeshop/const.dart';
import 'package:coffeeshop/pages/cartslide.dart';
import 'package:coffeeshop/pages/shopslide.dart';
import 'package:coffeeshop/widgets/bottom_nav.dart';
import 'package:flutter/material.dart';

class HomeSlide extends StatefulWidget {
  const HomeSlide({super.key});

  @override
  State<HomeSlide> createState() => _HomeSlideState();
}

class _HomeSlideState extends State<HomeSlide> {

  int _selectedIndex = 0 ;
  void onTabChange(index){
    setState(() {
    _selectedIndex = index;
  });
  }

  final List<Widget> _slide =[
    Shop(),
    Cart()

];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Coffee Shop'),
          backgroundColor: headingBackgroundColor,
          foregroundColor: headingColor,
        ),
      backgroundColor: Color.fromARGB(255, 232, 223, 220),
      bottomNavigationBar: BottomNavBar(onTabChange: (index) => onTabChange(index),),
      body: _slide[_selectedIndex],
    );
  }
}