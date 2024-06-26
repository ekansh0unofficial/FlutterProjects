import 'package:flutter/material.dart';



class Homepage extends StatefulWidget {
  
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color.fromARGB(255, 213, 246, 214),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 84, 144, 86),
        title: Text("Money Log" , style: TextStyle(color: Colors.white , fontSize: 22),),
      ),  
    );
    }
  }
