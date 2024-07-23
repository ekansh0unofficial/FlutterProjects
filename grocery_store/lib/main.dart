import 'package:flutter/material.dart';
import 'package:grocery_store/src/theme/mythemeProvider.dart';
import 'package:provider/provider.dart';

import 'src/app.dart';

void main() async {
  runApp(ChangeNotifierProvider(
    create: (_) => ThemeNotifier(),
    builder: (context, child) {
      return const MyApp();
    },
  ));
}
