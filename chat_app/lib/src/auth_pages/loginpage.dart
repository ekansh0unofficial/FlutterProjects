import 'package:chat_app/src/auth_pages/services/auth_service.dart';
import 'package:chat_app/src/components/myalertbox.dart';
import 'package:chat_app/src/components/mybutton.dart';
import 'package:chat_app/src/components/mytextfield.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Loginpage extends StatelessWidget {
  TextEditingController usernameController = TextEditingController();
  TextEditingController pwdController = TextEditingController();

  void Function()? onTap;
  Loginpage({super.key, required this.onTap});

  Future<void> login(BuildContext context) async {
    final authService = AuthService();

    try {
      await authService.signInWithEmailAndPassword(
          usernameController.text, pwdController.text);
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return MyAlertbox();
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Icon(Icons.message_rounded, size: 200),
                  Text(
                    "We are glad to have you back ",
                    style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MyTextfield(
                    usernameController,
                    label: "Username",
                    hintText: "Enter your username/email",
                    icon: false,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  MyTextfield(
                    pwdController,
                    label: "Password",
                    hintText: "Keep your password private",
                    icon: true,
                    obscure: true,
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "forgot your password?",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MyButton(onTap: () => login(context), title: "Sign In"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'not registered ? ',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                      GestureDetector(
                        onTap: onTap,
                        child: const Text(
                          ' register now',
                          style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
