import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:chat_app/src/theme/themeprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DayNightSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    bool isDarkMode = themeProvider.isDarkMode;

    return Center(
      child: AnimatedToggleSwitch<bool>.dual(
        current: isDarkMode,
        first: false,
        second: true,
        style: ToggleStyle(
          backgroundColor: isDarkMode ? Colors.grey : Colors.grey[100],
          indicatorColor: isDarkMode
              ? Colors.black
              : const Color.fromARGB(255, 255, 242, 123),
          borderColor: Colors.blueGrey,
        ),
        height: 50.0,
        spacing: 20.0,
        onChanged: (value) {
          themeProvider.toggleTheme();
        },
        iconBuilder: (value) => value
            ? const Icon(Icons.dark_mode, color: Colors.white)
            : const Icon(Icons.light_mode,
                color: Color.fromARGB(255, 187, 128, 0)),
        textBuilder: (value) => value
            ? const Center(child: Text('Dark'))
            : const Center(
                child: Text(
                'Light',
                style: TextStyle(
                    color: Color.fromARGB(255, 231, 173, 0),
                    fontWeight: FontWeight.w800),
              )),
      ),
    );
  }
}
