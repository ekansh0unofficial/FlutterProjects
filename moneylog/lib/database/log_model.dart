import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:moneylog/logpage.dart';

class Log{
  double amount ; 
  String category ;
  String description  ;

  Log({required this.amount ,required this.category, this.description = ""});
}

class LogSheet {

  List<Log> logsheet = [];
  double total = 0 ;

  
  void addlogEntry(Log log){
    logsheet.add(log);
    total = total + log.amount;
  }

  void removelogEntry(Log log){
    logsheet.remove(log);
    total = total - log.amount;
  }

  void editlogEntry(Log log , String? description , String? category , double? value){
      var temp = log.amount; 
      log.amount = value ?? log.amount;
      total = total - temp + log.amount;
      log.category = category ?? log.category;
      log.description = description ?? log.description;
  }
  
}

class LogBook extends ChangeNotifier {

  List<Logpage> logbook = [];
  Map<String ,LogSheet> logsheetMap = {};

  void addLogPage(String name){
    var sheet = LogSheet();
    logsheetMap[name] =sheet;
    logbook.add(Logpage(name: name, sheet: sheet));
    notifyListeners();
  }

  void removeLogPage(Logpage page , BuildContext context){
      showDialog(
        context: context, 
        builder: (context){
          return AlertDialog(
            title: Text( "Do u want to delete ${page.name} ?"),
            actions: [
              TextButton(
                onPressed: (){
                  logsheetMap.remove(page.name);
                  logbook.remove(page);
                  Navigator.of(context).pop();
              }, child: Text("YES")),
              TextButton(onPressed: (){Navigator.of(context).pop();} , child: Text("NO"))
            ],
          );
        }
      );
      notifyListeners();
  }

  void openLogPage(Logpage page , BuildContext context){
      Navigator.push( context , MaterialPageRoute(builder: (context)=>page) );
      notifyListeners();
  }
}

