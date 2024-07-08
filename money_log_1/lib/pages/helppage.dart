// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_log_1/widgets/mydrawer.dart';

class HelpPage extends StatelessWidget {
   HelpPage({super.key});

  TextStyle? headingFontStyle = GoogleFonts.courierPrime(fontSize: 18 , fontWeight: FontWeight.w400);
  TextStyle? subHeadingFontStyle = GoogleFonts.courierPrime(fontSize: 14 , fontWeight: FontWeight.w200);
  TextStyle? bodyFontStyle = GoogleFonts.courierPrime(fontSize: 12 , fontWeight: FontWeight.w100);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color.fromRGBO(243, 239, 239, 1)),
        backgroundColor: const Color.fromARGB(255, 218, 89, 29),
        title: const Text("Money Log" , style: TextStyle(color: Colors.white , fontSize: 22),),
      ),
      drawer: MyDrawer(),
      backgroundColor: const Color.fromARGB(255, 250, 248, 248),
      body:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Guide to use this Application : ' , style:  headingFontStyle,)
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('1> HomePage -> ', style: subHeadingFontStyle),
                      Text('(i) Every logpage has a unique name , No 2 pages can take have same name.' , style: bodyFontStyle),
                      Text('(ii) A Logpage without any entries will be automatically Deleted.', style: bodyFontStyle),
                      Text('(iii) Slide the particular entry to left to delete it. ', style: bodyFontStyle),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text('2>LogPage ->' , style: subHeadingFontStyle, ),
                      ),
                      Text('(i) Category cannot be left empty' , style: bodyFontStyle ),
                      Text('(ii) Use and work with log entries carefully',style: bodyFontStyle  ),
                      SizedBox(height: 40,),
                      Text('I hope u like this App' , style: headingFontStyle),
                    ],
                  ),
                )
              ],
        ),
    );
  }
}