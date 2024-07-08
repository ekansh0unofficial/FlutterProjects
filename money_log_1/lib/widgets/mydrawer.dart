// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:money_log_1/navigation/routes.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        surfaceTintColor: Colors.white,
        child: ListView(
          children:  [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.orange
                ),
                curve: Curves.bounceIn,
                child: Padding(
                  padding: EdgeInsets.only(left :8.0 , top: 16),
                  child: Text('MONEYLOG' , style: TextStyle(color :Colors.white)),
                ),
              ),
              ListTile(
               leading: Icon(Icons.home), title: Text('Home') ,
               onTap: (){
                
                Navigator.pushNamed(context, MyRoutes.homeRoute);
               }, 
              ),
              ListTile(
                leading: Icon(Icons.help), title: Text('Help') ,
                onTap: (){
                Navigator.of(context).pop();
                Navigator.pushNamed(context, MyRoutes.helpRoute);
               },
              ),
              ListTile(
                leading: Icon(Icons.person), title :Text('Creator'),
                onTap: (){
                Navigator.of(context).pop();
                Navigator.pushNamed(context, MyRoutes.createrRoute);
               },
            )   
          ],
        ),
    );
  }
}