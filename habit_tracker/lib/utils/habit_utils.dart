import 'package:flutter/material.dart';
import 'package:habit_tracker/database/habit_database.dart';
import 'package:habit_tracker/models/habit.dart';
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

void checkHabitOnOff(BuildContext context, bool? b, Habit habit) {
  if (b != null) {
    context.read<HabitDatabase>().updateHabitCompletion(habit.id, b);
  }
}

void editHabit(BuildContext context, Habit habit, textController) {
  textController.text = habit.name;

  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      content: TextField(
        controller: textController,
        decoration: const InputDecoration(hintText: "Edit the name"),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Cancel")),
        TextButton(
            onPressed: () {
              String newHabitName = textController.text;
              context
                  .read<HabitDatabase>()
                  .updateHabitName(habit.id, newHabitName);
              Navigator.pop(context);
            },
            child: Text("Save")),
      ],
    ),
  );
}

void deleteHabit(BuildContext context, Habit habit) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      content: const Text("Are You Sure , this cannot be undone"),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("NO")),
        TextButton(
            onPressed: () {
              context.read<HabitDatabase>().deleteHabit(habit.id);
              Navigator.pop(context);
            },
            child: const Text("YES")),
      ],
    ),
  );
}
