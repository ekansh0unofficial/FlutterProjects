import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moneylog/logpage.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class LogTile extends StatelessWidget {

  
  LogTile({super.key , required this.onTap ,required this.page , required this.onDeleted});

  void Function()? onTap;
  Logpage page;
  void Function(BuildContext)? onDeleted;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
          motion: StretchMotion(), 
          children: [
              SlidableAction(
                onPressed: onDeleted , 
                icon: Icons.delete,
                backgroundColor: Color.fromARGB(255, 238, 109, 10),
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
              color: Color.fromARGB(255, 255, 226, 210),
              borderRadius: BorderRadius.circular(8), 
            ),
            child:  Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.book  , color: const Color.fromARGB(255, 52, 51, 51)),
                      SizedBox(width: 12,),
                      Text( "${page.name}" , 
                      style: TextStyle(
                        color: Color.fromARGB(255, 250, 65, 65) ,
                        fontSize: 22 , 
                        fontFamily : GoogleFonts.roboto.toString()  ) ),
                    ],
                  ),
                  Icon(Icons.arrow_back_ios , size: 18 , color: Colors.black54)

                ],
              ),
            )
          ),
        )
        ),
    );
  }
}

