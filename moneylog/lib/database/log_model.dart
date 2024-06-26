import 'package:flutter/foundation.dart';

class Log{
  double amount ; 
  String category ;
  String description  ;

  Log({required this.amount ,required this.category, this.description = ""});
}

class LogSheet extends ChangeNotifier{

  List<Log> logsheet = [Log(amount: 200, category: "Food" , description: "Apple" )];
  double total = 0 ;

  
  void addlogEntry(Log log){
    logsheet.add(log);
    total = total + log.amount;
    notifyListeners();
  }

  void removelogEntry(Log log){
    logsheet.remove(log);
    total = total - log.amount;
    notifyListeners();
  }

  void editlogEntry(Log log , String? description , String? category , double? value){
      var temp = log.amount; 
      log.amount = value ?? log.amount;
      total = total - temp + log.amount;
      log.category = category ?? log.category;
      log.description = description ?? log.description;
      notifyListeners();    
  }
  
}




