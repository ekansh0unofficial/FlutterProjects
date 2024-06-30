// ignore_for_file: sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:moneylog/database/log_model.dart';
import 'package:moneylog/logpage.dart';
import 'package:moneylog/widgets/logtile.dart';
import 'package:provider/provider.dart';



class Homepage extends StatefulWidget {
  
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  void onDeleted(Logpage page){
    LogBook book = Provider.of<LogBook>(context , listen: false);
    book.removeLogPage(page, context);    
  }


  void addToBook(){ 
    LogBook book = Provider.of<LogBook>(context , listen: false);
    TextEditingController _controller = TextEditingController();
      showDialog(
        context: context, 
        builder: (context) => 
        AlertDialog(
          title: Text("Add Log"),
          titleTextStyle: TextStyle(color: Color.fromARGB(255, 32, 31, 31) , fontSize: 20),
          content: TextFormField(
            controller: _controller,
            decoration: InputDecoration(
              label: Text("Name"),
              labelStyle: TextStyle(color: Color.fromARGB(255, 74, 72, 72)),
              hintText: "Name of log",
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12) ,
                borderSide: BorderSide(color: Color.fromARGB(255, 255, 129, 90))
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12) ,
                borderSide: BorderSide(color: Color.fromARGB(255, 255, 129, 90))
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12) ,
                borderSide: BorderSide(color: Color.fromARGB(255, 168, 0, 0))
              )
            ),
          ),
          actions: [
              TextButton(
                child : Text("Save" ,  style: TextStyle(color: Color.fromARGB(255, 248, 85, 40))),
                onPressed: (){
                  setState(() {
                    book.addLogPage(_controller.text);
                  });
                  Navigator.of(context).pop();
                },
                ),
                TextButton(onPressed: (){Navigator.of(context).pop();}, child: Text("Cancel" , style: TextStyle(color: Color.fromARGB(255, 122, 49, 29))))       
          ],
        ),
      );
  }

  void onTap(Logpage page){
     Provider.of<LogBook>(context, listen: false).openLogPage(page, context);
  }

  @override
  Widget build(BuildContext context) {
     LogBook book = Provider.of<LogBook>(context , listen: false);
    return  Consumer<LogBook>(builder: (context , index , value) => 
    Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 215, 176),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 218, 89, 29),
        title: Text("Money Log" , style: TextStyle(color: Colors.white , fontSize: 22),),
      ),  
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            itemCount: book.logbook.length,
            itemBuilder: (context ,index ){
                var page = book.logbook[index];
                return  LogTile(onTap: ()=> onTap(page), page: page  , onDeleted: (context) => onDeleted(page) , );
            }
        ),
      ),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add), onPressed: () => addToBook() ,),
    ),
    );
  }
}
