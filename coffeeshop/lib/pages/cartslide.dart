// ignore_for_file: prefer_const_constructors

import 'package:coffeeshop/pages/models/coffee_model.dart';
import 'package:coffeeshop/pages/models/coffee_shop.dart';
import 'package:coffeeshop/widgets/cart_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

 class Cart extends StatefulWidget {
  
  const Cart({super.key});
  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {

  void removeFromCart(Coffee coffee){
      Provider.of<CoffeeModel>(context , listen: false).removeFromCart(coffee);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeModel>(
      builder: (context, value, child) => 
      SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              SizedBox(height: 24,),
              Expanded(
                flex : 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16),
                  child: Text("How do u like your coffee?" , style: TextStyle(color: Colors.black87, fontSize:22 ),),
                ),
              ),

              Expanded(
                flex : 5,
                child: ListView.builder(
                  itemCount: value.coffeecart.length,
                  itemBuilder: (context , index){
                        var coffee = value.coffeecart[index];
                        return CartItem(item: coffee ,onPressed : ()=> removeFromCart(coffee));
                  }
                )
              )
          ],
        ),
      ),
    );
  }
}

