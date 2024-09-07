import 'package:flutter/material.dart';
import 'package:habit_tracker/models/app_settings.dart';
import 'package:habit_tracker/models/habit.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class HabitDatabase extends ChangeNotifier {
  static late Isar isar;

  //init ISAR
  static Future<void> initialisedatabase() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [HabitSchema, AppSettingsSchema],
      directory: dir.path,
    );
  }

  //init the First Launch Date
  Future<void> saveFirstLaunchDate() async {
    final existingSettings = await isar.appSettings.where().findFirst();
    if (existingSettings == null) {
      final settings = AppSettings()..firstLaunchDate = DateTime.now();
      await isar.writeTxn(() => isar.appSettings.put(settings));
    }
  }

  //getter
  Future<DateTime?> getFirstLaunchDate() async {
    final settings = await isar.appSettings.where().findFirst();
    return settings?.firstLaunchDate;
  }

  //Init habit list
  final List<Habit> currentHabits = [];

  //add a habit to list
  Future<void> addHabit(String habitName) async {
    //create a habit
    final newHabit = Habit()..name = habitName;
    //put it into database
    await isar.writeTxn(() => isar.habits.put(newHabit));
    readHabits();
  }

  //read habits
  Future<void> readHabits() async {
    List<Habit> fetchedHabits = await isar.habits.where().findAll();
    currentHabits.clear();
    currentHabits.addAll(fetchedHabits);

    notifyListeners();
  }

  //updating the activity status for particular day
  Future<void> updateHabitCompletion(int id, bool isCompleted) async {
    final habit = await isar.habits.get(id);

    if (habit != null) {
      await isar.writeTxn(() async {
        //if activity is completed and not in list
        if (isCompleted && !habit.completedDays.contains(DateTime.now())) {
          final today = DateTime.now();

          habit.completedDays.add(DateTime(today.year, today.month, today.day));
        }
        //if activity not completed
        else {
          habit.completedDays.removeWhere(
            (date) =>
                date.day == DateTime.now().day &&
                date.month == DateTime.now().month &&
                date.year == DateTime.now().year,
          );
        }
        await isar.habits.put(habit);
      });
    }
  }

  //update name of habits
  Future<void> updateHabitName(int id, String newName) async {
    final habit = await isar.habits.get(id);

    if (habit != null) {
      await isar.writeTxn(() async {
        habit.name = newName;
        isar.habits.put(habit);
      });
    }
  }

  //deleting a habit
  Future<void> deleteHabit(int id) async {
    await isar.writeTxn(() async {
      isar.habits.delete(id);
    });
    readHabits();
  }
}
