import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';

class MyHeatMap extends StatelessWidget {
  final DateTime startDate;
  final Map<DateTime, int>? datasets;
  final DateTime today;

  MyHeatMap(
      {super.key,
      required this.startDate,
      required this.datasets,
      required this.today});

  @override
  Widget build(BuildContext context) {
    return datasets != null
        ? HeatMap(
            startDate: startDate,
            endDate: today.add(const Duration(days: 30)),
            textColor: Theme.of(context).colorScheme.onSecondary,
            datasets: datasets,
            defaultColor: Theme.of(context).colorScheme.secondary,
            scrollable: true,
            size: 30,
            showText: true,
            showColorTip: false,
            colorMode: ColorMode.color,
            colorsets: const {
              1: Color.fromARGB(255, 137, 224, 140),
              2: Color.fromARGB(255, 80, 206, 84),
              3: Color.fromARGB(255, 68, 165, 72),
              4: Color.fromARGB(255, 53, 143, 56),
              5: Color.fromARGB(255, 47, 129, 50),
              6: Color.fromARGB(255, 40, 119, 43)
            },
          )
        : Text("No Dataset passed");
    ;
  }
}
