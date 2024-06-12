// ignore_for_file: unnecessary_string_escapes, prefer_final_fields, unused_field

import 'package:coffeeshop/pages/models/coffee_model.dart';
import 'package:flutter/material.dart';


 class CoffeeModel extends ChangeNotifier{

   List<Coffee> _shop = [
      Coffee(name : "Expresso " , price : "150.00" ,image_string:  "lib/images/expresso.png"),
      Coffee(name: "Hot Tea" , price: "80.00" , image_string: "lib/images/hot-tea_2391726.png"),
      Coffee(name: "Latte" , price: "125.00" , image_string: "lib/images/coffee-latte_2391710.png"),
      Coffee(name: "Premium Coffee Shots" ,price: "200.00" , image_string: "lib/images/cup_15614759.png") 
];

  List<Coffee> _cart = [];

  List<Coffee> get coffeeshop => _shop;
  List<Coffee> get coffeecart => _cart; 
  
  
  void addToCart(Coffee coffee){
    if(!_cart.contains(coffee)){
      _cart.add(coffee);
      notifyListeners();
    }
    
  }
  
  void removeFromCart(Coffee coffee){
    if(_cart.contains(coffee) || coffee.quantity == 0){
    _cart.remove(coffee);
    coffee.setQuantity = 0 ;
    notifyListeners();}
  }   

  void incrementquantity(Coffee coffee){
    coffee.setQuantity = coffee.quantity +1  ;
    notifyListeners();
  }

  void decreamentquantity(Coffee coffee){
    if(coffee.quantity>0){coffee.setQuantity = coffee.quantity -1;}
    if(coffee.quantity == 0){_cart.remove(coffee);}

    notifyListeners();
  }
}

