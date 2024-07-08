
import 'package:hive/hive.dart';
import '../database/log_model.dart';

@HiveType(typeId: 1)
class LogSheet {

  LogSheet({required this.logsheet ,  this.total=0});

  @HiveField(0)
  late List<Log> logsheet =[];
  
  @HiveField(1)
  late double total;

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


