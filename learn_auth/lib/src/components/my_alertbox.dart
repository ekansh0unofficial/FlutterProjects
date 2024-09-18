import 'package:flutter/material.dart';

class MyAlertbox extends StatelessWidget {
  final String? message;
  final String title;
  final IconData icon;
  final Color iconColor;

  const MyAlertbox({
    super.key,
    this.message,
    this.title = "Error",
    this.icon = Icons.error,
    this.iconColor = const Color.fromARGB(146, 244, 67, 54),
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      titlePadding: const EdgeInsets.all(0),
      contentPadding: const EdgeInsets.fromLTRB(24.0, 8.0, 24.0, 24.0),
      title: Container(
        decoration: BoxDecoration(
          color: iconColor.withOpacity(0.1),
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(icon, color: iconColor, size: 28),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: iconColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      content: Text(
        message ?? "An unknown error occurred.",
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
