import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import '../pages/logpage.dart';
import 'logsheet_model.dart';


@HiveType(typeId: 0)
class Log extends HiveObject{

  @HiveField(0)
  double amount ;

  @HiveField(1)
  String category ;

  @HiveField(2)
  String description  ;

  Log({required this.amount ,required this.category, this.description = ""});
}

class LogBook extends ChangeNotifier {

  Map<String ,LogSheet> logsheetMap = {};

  final _sheetbox = Hive.box('logsheet');

  LogBook(){
    loadAppData();
  }

  editAppData(){
    _sheetbox.put('MAP' , logsheetMap);
  }
  
  loadAppData(){
    final data = _sheetbox.get('MAP');
  if (data != null) {
    logsheetMap = Map<String, LogSheet>.from(data);
  }
  notifyListeners();
  }
  
  void addLogPage(String name){
    if(!logsheetMap.containsKey(name)){ 
      var sheet = LogSheet( logsheet: [] );
      logsheetMap[name] =sheet;
      _sheetbox.put(name , sheet);}

    notifyListeners();
  }

  void removeLogSheet(String name , BuildContext context){
      showDialog(
        context: context, 
        builder: (context){
          return AlertDialog(
            title: Text( "Do u want to delete $name ?"),
            actions: [
              TextButton(onPressed: (){Navigator.of(context).pop();} , child: const Text("NO")),
              TextButton(
                onPressed: (){
                  logsheetMap.remove(name);
                  editAppData();
                  notifyListeners();
                  Navigator.of(context).pop();
              }, child: const Text("YES")),
            ],
          );
        }
      );
      notifyListeners();
  }

   void openLogSheet(String name, BuildContext context) {
    var sheet = logsheetMap[name];
    if (sheet != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Logpage(name: name, sheet: sheet)),
      );
    }
  }

  void addLog(String sheetName, Log log) {
    var sheet = logsheetMap[sheetName];
    if (sheet != null) {
      sheet.addlogEntry(log);
      editAppData();
      notifyListeners();
    }
  }

  void removeLog(String sheetName, Log log) {
    var sheet = logsheetMap[sheetName];
    if (sheet != null) {
      sheet.removelogEntry(log);
      editAppData();
      notifyListeners();
    }
  }

  void editLog(String sheetName, Log log ,  String? description , String? category , double? value)  {
    var sheet = logsheetMap[sheetName];
    if (sheet != null) {
      sheet.editlogEntry(log , description , category , value);
      editAppData();
      notifyListeners();
    }
  }
}

