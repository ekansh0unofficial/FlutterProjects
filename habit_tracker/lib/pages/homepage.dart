import 'package:flutter/material.dart';
import 'package:habit_tracker/components/habit_tile.dart';
import 'package:habit_tracker/components/heat_map.dart';
import 'package:habit_tracker/components/mydrawer.dart';
import 'package:habit_tracker/database/habit_database.dart';
import 'package:habit_tracker/models/habit.dart';
import 'package:habit_tracker/utils/habit_utils.dart';
import 'package:habit_tracker/utils/heatmap_util.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    context.read<HabitDatabase>().readHabits();
    super.initState();
  }

  final TextEditingController habitcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const Mydrawer(),
      floatingActionButton: FloatingActionButton(
        elevation: 8,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        child: const Icon(Icons.add),
        onPressed: () => createNewHabit(context, habitcontroller),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeatMap(),
            _buildHabitList(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeatMap() {
    final habitDatabase = context.watch<HabitDatabase>();
    List<Habit> currentHabits = habitDatabase.currentHabits;

    return FutureBuilder<DateTime?>(
        future: habitDatabase.getFirstLaunchDate(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return MyHeatMap(
              startDate: snapshot.data!,
              datasets: prepareMapDataSet(currentHabits),
              today: DateTime.now(),
            );
          } else {
            return Container();
          }
        });
  }

  Widget _buildHabitList() {
    final habitDatabase = context.watch<HabitDatabase>();

    List<Habit> currentHabits = habitDatabase.currentHabits;

    return ListView.builder(
        itemCount: currentHabits.length,
        shrinkWrap: true,
        // physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final habit = currentHabits[index];

          bool isCompletedToday = isHabitCompletedToday(habit.completedDays);

          return HabitTile(
            isCompleted: isCompletedToday,
            name: habit.name,
            onChanged: (value) => checkHabitOnOff(context, value, habit),
            onedit: (context) => editHabit(context, habit, habitcontroller),
            ondelete: (context) => deleteHabit(context, habit),
          );
        });
  }
}
