import 'package:flutter/material.dart';
import 'package:trying_new_ui_widgets/light_switch.dart';

void main() {
  runApp( MainApp());
}

class MainApp extends StatelessWidget {
   MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LightSwitch());
  }
}
