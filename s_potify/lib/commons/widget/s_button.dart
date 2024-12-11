import 'package:flutter/material.dart';

class SButton extends StatelessWidget {
  SButton(
      {super.key, required this.onPressed, required this.title, this.height});
  void Function()? onPressed;
  double? height;
  String title;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            minimumSize: Size.fromHeight(height ?? 80)),
        child: Text(title, style: const TextStyle(color: Colors.white)));
  }
}
