import 'package:chat_app/src/components/mytextbox.dart';
import 'package:flutter/material.dart';

class Loginpage extends StatelessWidget {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),
            Text(
              "Welcome back , you were missed",
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
            const SizedBox(height: 25),
            MyTextfield(
              username,
              label: "USERNAME",
              icon: false,
              hintText: "Enter your username/Email ID",
            ),
            const SizedBox(height: 25),
            MyTextfield(
              password,
              label: "PASSWORD",
              icon: true,
              hintText: "Keep your passwords secure",
            ),
          ],
        ),
      ),
    );
  }
}
