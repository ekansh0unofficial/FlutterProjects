import 'package:flutter/material.dart';
import 'package:grocery_store/src/feature/home/view/home.dart';
import 'package:grocery_store/src/theme/mythemeProvider.dart';
import 'package:provider/provider.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
        builder: (context, value, child) => MaterialApp(
              theme: value.currentTheme,
              debugShowCheckedModeBanner: false,
              home: Home(),
            ));
  }
}
