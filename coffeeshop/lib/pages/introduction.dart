// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:coffeeshop/const.dart';
import 'package:coffeeshop/pages/homeslide.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class Introduction extends StatelessWidget {
  const Introduction({super.key});

   
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
                Expanded(flex : 10,child: Text("Coffee Shop")),
                Expanded(flex : 2 ,child: LottieBuilder.network("https://lottie.host/ba19ea50-4b9a-4a53-8a94-c5576c39af6b/F6MA5GKIoK.json", height: 50,), )
            ],
          ),
          backgroundColor: headingBackgroundColor,
          foregroundColor: headingColor,
          

        ),
        body:  Center(
          child: Padding(
            padding: EdgeInsets.symmetric( vertical: 25 , horizontal: 22),
            child: Column(
              children: [
                Expanded(flex: 2, child : Container()),
                  Expanded(
                    flex : 5 , 
                    child: Column(
                      children : [
                        Image.asset("lib/images/coffee-shop_2391803.png" , height: 150,),
                        SizedBox(height: 12,),
                        Text("Brew Day", style: TextStyle(fontSize: 16 , color: headingColor),),
                        Text("Explore our premium coffee collection", style: TextStyle(color: Colors.black87 , fontSize: 12))
                      ]
                    ),
                  ),
                  Expanded(
                    flex: 1, 
                    
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 34),
                        child : Material(
                          color: buttonBackgroundColor,
                          borderRadius: BorderRadius.circular(12),
                          child: InkWell(
                          onTap:(){
                            Navigator.push(context , MaterialPageRoute(builder: (context) => HomeSlide()) );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            Text("Enter Shop" , style: TextStyle(color: buttonTextColor),),
                            SizedBox(width: 6,),
                            Icon(Icons.arrow_forward , color: buttonTextColor,)
                            ],
                          ),
                         ),
                        ),
                    )
                  )

                  
                  
              ],
            ),
          ),
        ),
    );
  }
}