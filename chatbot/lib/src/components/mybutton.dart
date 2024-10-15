import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  final Color? color;
  final Color? textColor;
  const MyButton(
      {super.key,
      required this.onTap,
      required this.title,
      this.color,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        child: Ink(
          decoration: BoxDecoration(
            color: color ?? Colors.black,
            borderRadius: BorderRadius.circular(8),
          ),
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(8),
            splashColor: const Color.fromARGB(10, 255, 255, 255),
            hoverColor: const Color.fromARGB(10, 255, 255, 255),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 70),
              child: Center(
                child: Text(
                  title,
                  style:
                      TextStyle(color: textColor ?? Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
