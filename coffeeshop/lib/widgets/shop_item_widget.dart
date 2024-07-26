//import 'package:coffeeshop/const.dart';
// ignore_for_file: must_be_immutable, prefer_const_constructors, prefer_const_literals_to_create_immutables


import 'package:coffeeshop/pages/models/coffee_model.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class ShopItem extends StatefulWidget {
  
  Coffee item ; 
  void Function()? onAdd;
  void Function()? onRemove;

  ShopItem({super.key , required this.item , required this.onAdd , required this.onRemove});

  @override
  State<ShopItem> createState() => _ShopItemState();
}

class _ShopItemState extends State<ShopItem> with SingleTickerProviderStateMixin{

  late final AnimationController _controller;
  bool _isLiked = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this , duration: Duration(seconds: 2));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override  
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(color: Colors.white60, borderRadius: BorderRadius.circular(12)),
        margin: EdgeInsets.all(2),
        child: ListTile(
          leading: Image.asset(widget.item.image_string, height: 70 ,),
          title: Text(widget.item.name),
          subtitle: Text(widget.item.price),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
               
                GestureDetector(
                  
                  onTap:(){
                        if(_isLiked){
                          _controller.reverse();
                          setState(() {
                            _isLiked = false;
                          });
                        }
                        else{
                          _controller.forward();
                          setState(() {
                            _isLiked = true;
                          });                          
                        }
                  },
                  child: Container(
                    
                    child: LottieBuilder.network("https://lottie.host/82f40bba-3c7d-4050-9624-e2f9bd04f6b4/Vs4fsc9Kcj.json", height: 200,controller: _controller, ))

                ),
              
                IconButton(onPressed: widget.onRemove, icon: Icon(Icons.remove)),
                Text("${widget.item.quantity}"),
                IconButton(onPressed: widget.onAdd, icon: Icon(Icons.add))
            ],
          ),
        ),
      ),
    );
  }
} 