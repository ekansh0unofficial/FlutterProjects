import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../theme/themeprovider.dart';

class DayNightSwitch extends StatelessWidget {
  const DayNightSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    // Accessing the current theme mode from the ThemeProvider
    var themeProvider = Provider.of<Themeprovider>(context);
    bool isDarkMode = themeProvider.isDarkMode();

    return Center(
      child: AnimatedToggleSwitch<bool>.dual(
        current: isDarkMode,
        first: false, // Light mode
        second: true, // Dark mode
        animationDuration:
            const Duration(milliseconds: 500), // Animation duration
        animationCurve: Curves.easeInOutCirc, // Animation curve
        indicatorSize: const Size(60, 30), // Custom indicator size

        iconBuilder: (value) => value
            ? const Icon(Icons.dark_mode, color: Colors.black)
            : const Icon(Icons.light_mode, color: Colors.yellow),

        textBuilder: (value) => value
            ? const Center(
                child: Text('Dark', style: TextStyle(color: Colors.white)))
            : const Center(
                child: Text('Light', style: TextStyle(color: Colors.black))),

        borderWidth: 2.0, // Custom border width
        style: ToggleStyle(
          backgroundColor: Colors.grey[300]!,
          indicatorColor: isDarkMode ? Colors.black : Colors.yellow,
          borderColor: Colors.blueGrey,
        ),
        height: 50.0, // Height of the switch
        spacing: 20.0, // Space between icons and text

        onChanged: (value) {
          // Toggle the theme mode when the switch is changed
          themeProvider.toggleTheme(); // Call the toggleTheme method
        },

        active: true, // To ensure the toggle is active
        clipBehavior: Clip.antiAlias, // Clipping behavior of the widget
        opacityAnimation: true, // Enables opacity animation
        inactiveOpacity: 0.6, // Opacity when inactive
        inactiveOpacityCurve:
            Curves.easeInOut, // Curve for inactive opacity animation
      ),
    );
  }
}
