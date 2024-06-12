// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:coffeeshop/pages/models/coffee_model.dart';
import 'package:coffeeshop/pages/models/coffee_shop.dart';
import 'package:coffeeshop/widgets/shop_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {

  void addToCart(Coffee coffee){
    Provider.of<CoffeeModel>(context , listen:false).addToCart(coffee);
  }

  void addQuantity(Coffee coffee){
    Provider.of<CoffeeModel>(context , listen: false).incrementquantity(coffee);
  }
  
  void removeQuantity(Coffee coffee){
    Provider.of<CoffeeModel>(context , listen: false).decreamentquantity(coffee);
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
                  itemCount: value.coffeeshop.length,
                  itemBuilder: (context , index){
                        var coffee = value.coffeeshop[index];
                        return ShopItem(
                          item: coffee , 
                          onAdd: () {
                            addToCart(coffee);
                            addQuantity(coffee);},
                          onRemove: (){
                            removeQuantity(coffee);},  
                        );
                  }
                )
              )
          ],
        ),
      ),
    );
  }
}