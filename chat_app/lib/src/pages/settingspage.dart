import 'package:chat_app/src/components/daynightswitch.dart';
import 'package:chat_app/src/components/mydrawer.dart';
import 'package:flutter/material.dart';

class Settingspage extends StatefulWidget {
  const Settingspage({super.key});

  @override
  State<Settingspage> createState() => _SettingspageState();
}

class _SettingspageState extends State<Settingspage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("SETTINGS")),
      drawer: const Mydrawer(),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "COLOR MODE",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          DayNightSwitch(),
        ],
      ),
    );
  }
}
