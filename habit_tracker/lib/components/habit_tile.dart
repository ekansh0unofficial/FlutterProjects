import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HabitTile extends StatelessWidget {
  final bool isCompleted;
  final String name;
  final void Function(bool?)? onChanged;
  final void Function(BuildContext)? ondelete;
  final void Function(BuildContext)? onedit;
  const HabitTile({
    super.key,
    required this.isCompleted,
    required this.name,
    required this.onChanged,
    required this.ondelete,
    required this.onedit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: isCompleted
              ? Colors.green.shade300
              : Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
      child: Slidable(
        endActionPane: ActionPane(
          extentRatio: 1 / 3,
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              padding: const EdgeInsets.all(0),
              onPressed: onedit,
              backgroundColor: Colors.grey.shade800,
              icon: Icons.settings,
              borderRadius: BorderRadius.circular(8),
            ),
            SlidableAction(
              padding: const EdgeInsets.all(0),
              onPressed: ondelete,
              backgroundColor: Colors.grey.shade800,
              icon: Icons.delete,
              borderRadius: BorderRadius.circular(8),
            )
          ],
        ),
        child: GestureDetector(
          onTap: () {
            if (onChanged != null) {
              onChanged!(!isCompleted);
            }
          },
          child: ListTile(
            title: Text(name),
            leading: Checkbox(
              value: isCompleted,
              onChanged: onChanged,
              activeColor: Colors.white,
              checkColor: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
