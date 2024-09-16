import 'package:flutter/material.dart';
// import 'package:trying_new_ui_widgets/light_switch.dart';
import 'package:trying_new_ui_widgets/list_tile.dart';
import 'package:trying_new_ui_widgets/my_shimmer_container.dart';
import 'package:trying_new_ui_widgets/my_shimmer_list_tile.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Column(
      children: [
        MyListTile(),
        const ShimmerContainer(),
        const ShimmerListTile()
      ],
    )));
  }
}
