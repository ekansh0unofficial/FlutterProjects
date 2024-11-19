// ignore_for_file: must_be_immutable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/global_components/myalertbox.dart';
import '../components/global_components/mybutton.dart';
import '../components/global_components/mytextbox.dart';
import 'authservice.dart';

class Loginpage extends StatelessWidget {
  Loginpage({super.key, required this.loginSwitch});

  void Function()? loginSwitch;

  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  final Authservice _authService = Authservice();

  void signIn(BuildContext context) async {
    try {
      await _authService.signInWithEmailAndPassword(
        _emailcontroller.text,
        _passwordcontroller.text,
      );
    } on FirebaseAuthException catch (e) {
      showDialog(
        context: context,
        builder: (context) => MyAlertbox(
          message: e.code,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Center(
              child: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          children: [
            //icon for application
            const SizedBox(
              height: 48,
            ),

            const Icon(Icons.message, size: 150),

            const SizedBox(
              height: 20,
            ),

            //name of the app
            const Text(
              "C H A T  A P P ",
              style: TextStyle(fontSize: 20),
            ),

            const SizedBox(
              height: 8,
            ),

            //welcome text
            const Text("We are glad to have you back"),

            //username
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MyTextfield(
                _emailcontroller,
                label: "Email",
                hintText: "Enter your Email Id",
                icon: false,
              ),
            ),

            //password
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: MyTextfield(
                _passwordcontroller,
                label: "Password",
                hintText: "Keep your passwords secure",
                icon: true,
                obscure: true,
              ),
            ),

            //forgot password
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 1.0, horizontal: 30.0),
                  child: Text("forgot password?"),
                ),
              ],
            ),

            // sign in
            const SizedBox(
              height: 12,
            ),
            MyButton(onTap: () => signIn(context), title: "Sign In"),

            //register now
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("not registered yet ? "),
                GestureDetector(
                  onTap: loginSwitch,
                  child: const Text(
                    "register now!",
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w600,
                        fontSize: 14),
                  ),
                ),
              ],
            )
          ],
        ),
      ))),
    );
  }
}
