// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class CreatersPage extends StatelessWidget {
  CreatersPage({super.key});

  String introduction = 'Hello , I am a proficient app developer with good grasp of flutter and it\'s associated concepts. I am also adapt at various coding practises.To check my other projects please refer to my github.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Color.fromRGBO(243, 239, 239, 1)),
          backgroundColor: const Color.fromARGB(255, 218, 89, 29),
          title: const Text("Money Log" , style: TextStyle(color: Colors.white , fontSize: 22),),
        ),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                            radius: 50,
                            backgroundImage:
                  AssetImage("lib/assets/photos/IMG_20240203_181746.jpg")),
              ),
              SizedBox(
          height: 20,
          width: 20,
        ),
        Text(
          "EKANSH MITTAL",
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 20,
        ),
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Email : ", ),
                  Text("b422026@iiit-bh.ac.in", )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("GitHub : ",),
                  Text("ekansh0unofficial",)
                ],
              )
            ]),
            SizedBox(
              height: 200,
            ),
            Text(introduction  , textAlign: TextAlign.start,),
          ],
        ),
      )
    );
  }
}