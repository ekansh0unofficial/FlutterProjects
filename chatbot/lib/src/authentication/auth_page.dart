import 'package:chatbot/src/authentication/authservice.dart';
import 'package:chatbot/src/components/myalertbox.dart';
import 'package:chatbot/src/components/mybutton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  AuthPage({super.key});

  Authservice _auth = Authservice();

  final String welcome =
      "This is a chatbot powered by OpenAI, which recommends movies based on the input text you provide. "
      "It gives precise suggestions tailored to your interests and mood.";

  void googleSignIn(BuildContext context) {
    try {
      _auth.googleSignUp();
    } on FirebaseAuthException catch (e) {
      showDialog(
          context: context,
          builder: (context) => MyAlertbox(
                message: e.code,
              ));
    }
  }

  void anonymousLogin() {
    _auth.anonymousLogin();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.movie,
                  size: 100,
                  color: Colors.blue,
                ),
                const SizedBox(height: 16),
                Text(
                  welcome,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyButton(
                      onTap: () => googleSignIn(context),
                      title: "Google",
                      color: const Color.fromARGB(255, 15, 101, 172),
                    ),
                    MyButton(
                      onTap: () => anonymousLogin(),
                      title: "Guest",
                      color: const Color.fromARGB(255, 212, 212, 212),
                      textColor: Colors.black,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
