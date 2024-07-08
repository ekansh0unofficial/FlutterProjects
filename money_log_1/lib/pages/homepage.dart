// ignore_for_file: sort_child_properties_last, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../database/log_model.dart';
import '../widgets/logtile.dart';
import '../widgets/mydrawer.dart';




class Homepage extends StatefulWidget {
  const Homepage({super.key});

  
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  void onDeleted(String name) {
    LogBook book = Provider.of<LogBook>(context, listen: false);
    book.removeLogSheet(name, context);
  }

  void addToBook(){ 
    LogBook book = Provider.of<LogBook>(context , listen: false);
    TextEditingController controller = TextEditingController();
      showDialog(
        context: context, 
        builder: (context) => 
        AlertDialog(
          title: const Text("Add Log"),
          titleTextStyle: const TextStyle(color: Color.fromARGB(255, 32, 31, 31) , fontSize: 20),
          content: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              label: const Text("Name" , style: TextStyle(color: Color.fromARGB(255, 255, 129, 90)),),
              labelStyle: const TextStyle(color: Color.fromARGB(255, 74, 72, 72)),
              hintText: "Name of log",
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12) ,
                borderSide: const BorderSide(color: Color.fromARGB(255, 255, 129, 90))
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12) ,
                borderSide: const BorderSide(color: Color.fromARGB(255, 255, 129, 90))
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12) ,
                borderSide: const BorderSide(color: Color.fromARGB(255, 168, 0, 0))
              )
            ),
          ),
          actions: [
              
                TextButton(onPressed: (){Navigator.of(context).pop();}, child: const Text("Cancel" , style: TextStyle(fontSize: 16,color: Color.fromARGB(255, 122, 49, 29))))  ,
                TextButton(
                child : const Text("Save" ,  style: TextStyle(color: Color.fromARGB(255, 248, 85, 40) , fontSize: 16)),
                onPressed: (){
                  setState(() {
                    book.addLogPage(controller.text);
                  });
                  Navigator.of(context).pop();
                },
                ),     
          ],
        ),
      );
  }

  void onTap(String name) {
    Provider.of<LogBook>(context, listen: false).openLogSheet(name, context);
  }

  @override
  Widget build(BuildContext context) {
     LogBook book = Provider.of<LogBook>(context , listen: false);
    return  Consumer<LogBook>(builder: (context , index , value) => 
    Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 215, 176),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color.fromRGBO(243, 239, 239, 1)),
        backgroundColor: const Color.fromARGB(255, 218, 89, 29),
        title: const Text("Money Log" , style: TextStyle(color: Colors.white , fontSize: 22),),
      ), 
      drawer: const MyDrawer(), 
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            itemCount: book.logsheetMap.length,
            itemBuilder: (context ,index ){
              var sheetName = book.logsheetMap.keys.toList()[index];
              return LogTile(
                onTap: () => onTap(sheetName),
                page: sheetName,
                onDeleted: (context) => onDeleted(sheetName),
              );
            }
        ),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        foregroundColor: Colors.white,backgroundColor: Color.fromARGB(255, 255, 94, 0),
        child: const Icon(Icons.add),onPressed: () => addToBook() ,),
      ),
    );
  }
}
