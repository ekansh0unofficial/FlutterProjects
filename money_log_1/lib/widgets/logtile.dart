import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class LogTile extends StatelessWidget {

  
  LogTile({super.key , required this.onTap ,required this.page , required this.onDeleted});

  void Function()? onTap;
  String page;
  void Function(BuildContext)? onDeleted;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
          motion: const StretchMotion(), 
          children: [
              SlidableAction(
                onPressed: onDeleted , 
                icon: Icons.delete,
                backgroundColor: const Color.fromARGB(255, 238, 109, 10),
                borderRadius: BorderRadius.circular(12),
                autoClose: true,
              )
          ]
        ),
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.only(right: 8.0 , left: 16.0 , top : 4 , bottom: 4),
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 226, 210),
              borderRadius: BorderRadius.circular(8), 
            ),
            child:  Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.book  , color: Color.fromARGB(255, 52, 51, 51)),
                      const SizedBox(width: 12,),
                      Text( page , 
                      style: TextStyle(
                        color: const Color.fromARGB(255, 250, 65, 65) ,
                        fontSize: 22 , 
                        fontFamily : GoogleFonts.roboto.toString()  ) ),
                    ],
                  ),
                  const Icon(Icons.arrow_back_ios , size: 18 , color: Colors.black54)

                ],
              ),
            )
          ),
        )
        ),
    );
  }
}

