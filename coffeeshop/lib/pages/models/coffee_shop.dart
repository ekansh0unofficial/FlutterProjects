// ignore_for_file: unnecessary_string_escapes, prefer_final_fields, unused_field

import 'package:coffeeshop/pages/models/coffee_model.dart';
import 'package:flutter/material.dart';


 class CoffeeModel extends ChangeNotifier{

   List<Coffee> _shop = [
      Coffee("Expresso " , "150.00" , "lib/images/expresso.png"),
      Coffee("Hot Tea" , "80.00" , "lib/images/hot-tea_2391726.png"),
      Coffee("Latte" , "125.00" , "lib/images/coffee-latte_2391710.png"),
      Coffee("Premium Coffee Shots" , "200.00" , "lib/images/cup_15614759.png") 
];

  List<Coffee> _cart = [];

  List<Coffee> get coffeeshop => _shop;
  List<Coffee> get coffeecart => _cart; 
  
  void addToCart(Coffee coffee){
    _cart.add(coffee);
    notifyListeners();
  }
  
  void removeFromCart(Coffee coffee){
    _cart.remove(coffee);
    notifyListeners();
  }   
}

