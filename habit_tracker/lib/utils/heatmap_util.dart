import 'package:habit_tracker/models/habit.dart';

Map<DateTime, int> prepareMapDataSet(List<Habit> habits) {
  Map<DateTime, int> dataset = {};

  for (var habit in habits) {
    for (var date in habit.completedDays) {
      final standerdDate = DateTime(date.year, date.month, date.day);

      if (dataset.containsKey(standerdDate)) {
        dataset[standerdDate] = dataset[standerdDate]! + 1;
      } else {
        dataset[standerdDate] = 1;
      }
    }
  }
  return dataset;
}
