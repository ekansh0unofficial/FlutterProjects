import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyTextfield extends StatefulWidget {
  bool obscure;
  final String hintText;
  final String label;
  bool? icon;
  TextEditingController controller;

  MyTextfield(this.controller,
      {super.key,
      required this.label,
      this.hintText = "",
      this.obscure = false,
      this.icon});

  @override
  State<MyTextfield> createState() => _MyTextfieldState();
}

class _MyTextfieldState extends State<MyTextfield> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
        child: widget.icon == false
            ? TextField(
                controller: widget.controller,
                textAlign: TextAlign.center,
                obscureText: widget.obscure,
                decoration: InputDecoration(
                    label: Text(
                      widget.label,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey[800]),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    filled: true,
                    fillColor: Colors.grey[300],
                    hintStyle: TextStyle(color: Colors.grey[500]),
                    hintText: widget.hintText),
                cursorColor: Colors.grey[600],
              )
            : TextField(
                controller: widget.controller,
                textAlign: TextAlign.center,
                obscureText: widget.obscure,
                decoration: InputDecoration(
                    label: Text(
                      widget.label,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey[800]),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    filled: true,
                    suffixIcon: IconButton(
                        icon: widget.obscure
                            ? const Icon(Icons.visibility_rounded)
                            : const Icon(Icons.visibility_off_rounded),
                        onPressed: () {
                          setState(() {
                            widget.obscure = !widget.obscure;
                          });
                        }),
                    fillColor: Colors.grey[300],
                    hintStyle: TextStyle(color: Colors.grey[500]),
                    hintText: widget.hintText),
                cursorColor: Colors.grey[600],
              ));
  }
}
