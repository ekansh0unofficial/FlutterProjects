import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final String text;
  final onTap;

  const UserTile({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
            margin: const EdgeInsets.all(12),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12)),
            child: Text(
              text,
              style: const TextStyle(color: Colors.black),
            )));
  }
}
