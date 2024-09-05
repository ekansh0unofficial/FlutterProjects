import 'package:isar/isar.dart';

class Habit {
  Id id = Isar.autoIncrement;

  late String name;

  List<DateTime> completedDays = [
    //DateTime(year , month , day)
  ];
}
