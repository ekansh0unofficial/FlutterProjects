// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatelessWidget {

  final void Function(int)? onTabChange;
  const BottomNavBar({super.key , required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return GNav(
      onTabChange: (value)=> onTabChange!(value),
      mainAxisAlignment: MainAxisAlignment.center,
      tabActiveBorder: Border.all(),
      tabMargin: EdgeInsets.all(8),
      gap: 4,
      
      tabs: [
      GButton(icon : Icons.shopping_bag_outlined, text: "Shop",),
      GButton(icon: Icons.shopping_cart_outlined, text: "Cart")    
    ]);
  }
}