import 'package:flutter/material.dart';
import 'package:habit_tracker/database/habit_database.dart';
import 'package:provider/provider.dart';

void createNewHabit(BuildContext context, controller) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: TextField(
            decoration: const InputDecoration(hintText: "Add new Habit"),
            controller: controller,
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancel")),
            TextButton(
                onPressed: () {
                  String newHabitName = controller.text;
                  context.read<HabitDatabase>().addHabit(newHabitName);
                  Navigator.pop(context);
                },
                child: Text("Save")),
          ],
        );
      });
}

bool isHabitCompletedToday(List<DateTime> completedDays) {
  final today = DateTime.now();

  return completedDays.any((date) =>
      date.year == today.year &&
      date.month == today.month &&
      date.day == today.day);
}
