// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, sort_child_properties_last, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:moneylog/database/log_model.dart';
import 'package:moneylog/widgets/myalertbox.dart';
import 'package:moneylog/widgets/mylog.dart';
import 'package:provider/provider.dart';

class Logpage extends StatefulWidget {
  Logpage({super.key });

  @override
  State<Logpage> createState() => _LogpageState();
}

class _LogpageState extends State<Logpage> {

  TextEditingController descriptioncontroller = TextEditingController();
  TextEditingController amountcontroller = TextEditingController();
  String? category ; 

    void showDialogbox(){
    showDialog(
      context: context, 
      builder:(context){
          return MyAlertBox(
            amountController: amountcontroller, 
            descriptionController: descriptioncontroller, 
            selectedCategory: category,
            onSave: () => onSave(double.parse(amountcontroller.text) , category , descriptioncontroller.text),
            setCategory : (value){setState(() {
              category = value;
            });}
            );
      }   
    );
  }

  void onSave(double amount  , String? category , String description){
    setState(() {
    var logbook = Provider.of<LogSheet>(context , listen: false);
    var log = Log(amount: amount , description: description , category: category?? "ERROR" );
    logbook.addlogEntry(log);
    amountcontroller.clear();
    descriptioncontroller.clear();

  }  
    );
  }

  void onDelete(Log log){
    setState(() {
    var logbook = Provider.of<LogSheet>(context , listen: false);
    logbook.removelogEntry(log);
    });
  }

  void onEdit(Log log){

    amountcontroller.text = log.amount.toString();
    descriptioncontroller.text = log.description;
    category = log.category;
    showDialog(
      context: context , 
      builder: (context){
          return MyAlertBox(
              amountController: amountcontroller,
              descriptionController: descriptioncontroller,
              setCategory: (value){setState(() {
                category = value;
              });},
              selectedCategory: category,
              onSave: ()=>edit(log , double.parse(amountcontroller.text) , category , descriptioncontroller.text ) ,
            );
      }
    ) ;
  }

  void edit(Log log , double amount  , String? category , String description ){
    var logbook = Provider.of<LogSheet>(context , listen: false);
      setState(() {
        logbook.editlogEntry(log, description, category, amount);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LogSheet>(
      builder: (context ,value , child)=>Scaffold(
        backgroundColor: Color.fromARGB(255, 213, 246, 214),
        appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 84, 144, 86),
        title: Text("Money Log" , style: TextStyle(color: Colors.white , fontSize: 22),),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: ListView.builder(
                  itemCount: value.logsheet.length , 
                  itemBuilder: (context , index){
                   var mylog = value.logsheet[index];
                    return Mylog( log:mylog ,onDelete : ()=>onDelete(mylog) , onEdit: ()=> onEdit(mylog),);
                  }
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top : 22.0 , bottom : 18 , right: 18),
              child: Container(
                width: double.infinity  , 
                child : Text("₹ ${value.total}" ,
                textAlign: TextAlign.end, 
                style: TextStyle(color : Colors.black , fontSize: 20)
                )
              ),
            )
          ],
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(200)),
          backgroundColor: Color.fromARGB(255, 20, 251, 147) ,
          child: Icon(Icons.add  , color: Colors.white,), 
          onPressed: showDialogbox ,
        ),
      ),
      ),
    );
  }
}