//import 'package:coffeeshop/const.dart';
// ignore_for_file: must_be_immutable

import 'package:coffeeshop/pages/models/coffee_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ShopItem extends StatelessWidget {
  
  Coffee item ; 
  void Function()? onPressed;
  ShopItem({super.key , required this.item , required this.onPressed});

  @override  
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(color: Colors.white60, borderRadius: BorderRadius.circular(12)),
        margin: EdgeInsets.all(2),
        child: ListTile(
          leading: Image.asset(item.image_string, height: 70 ,),
          title: Text(item.name),
          subtitle: Text(item.price),
          trailing: IconButton(
             icon : Icon(Icons.add) ,
            onPressed: onPressed,
          ),
        ),
      ),
    );
  }
} 