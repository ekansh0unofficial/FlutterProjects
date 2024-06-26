// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moneylog/database/log_model.dart';

class Mylog extends StatelessWidget {
  
  Log log;
  void Function()? onDelete;
  void Function()? onEdit;

  Mylog( {super.key  ,required this.log , required this.onDelete , required this.onEdit });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color : Color.fromARGB(255, 215, 248, 216),
          borderRadius: BorderRadius.circular(12)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:8.0 , top : 4.0),
                  child: Text(log.description , style : TextStyle(fontSize: 16  , fontWeight: FontWeight.w600 , fontFamily: GoogleFonts.roboto.toString()) ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left : 8.0 , bottom : 4.0),
                  child: Text(log.category , style: TextStyle(color:  const Color.fromARGB(149, 0, 0, 0) , fontWeight: FontWeight.w200 , fontSize: 12 )),
                )
              ],
            ),
            Row(
              children: [

                 Padding(
                  padding: const EdgeInsets.only(left : 4.0, right : 8.0 , top: 4.0 , bottom : 4.0 ),
                  child: Text("₹ ${log.amount}" , style: TextStyle(fontSize: 14)),
                ),
                IconButton(onPressed: onEdit , icon: Icon(CupertinoIcons.pen,),),
                IconButton(onPressed: onDelete, icon: Icon(Icons.delete)),
               
              ],
            )
          ],
        )
      ),
    );
  }
}