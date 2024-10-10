import 'package:chat_app/src/auth_pages/services/auth_service.dart';
import 'package:chat_app/src/components/myalertbox.dart';
import 'package:chat_app/src/components/mybutton.dart';
import 'package:chat_app/src/components/mytextfield.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RegisterPage extends StatelessWidget {
  TextEditingController usernameController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  TextEditingController confirmPwdController = TextEditingController();

  void Function()? onTap;

  void signUp(BuildContext context) {
    if (pwdController.text == confirmPwdController.text) {
      AuthService().signUp(usernameController.text, pwdController.text);
      showDialog(
          context: context,
          builder: (context) => const MyAlertbox(
                iconColor: const Color.fromARGB(255, 33, 102, 35),
                title: "Success",
                message: "Successfuly signed up ",
                icon: Icons.check_circle_outline_sharp,
              ));
    } else {
      showDialog(
          context: context,
          builder: (context) => const MyAlertbox(
                message: "Passwords does'nt match ",
              ));
    }
  }

  RegisterPage({super.key, required this.onTap});

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
                    "We are happy to welcome you",
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
                    height: 5,
                  ),
                  MyTextfield(
                    confirmPwdController,
                    label: "Confirm Password",
                    hintText: "Keep your password private",
                    icon: false,
                    obscure: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MyButton(onTap: () => signUp(context), title: "Sign Up"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'already a member ? ',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                      GestureDetector(
                        onTap: onTap,
                        child: const Text(
                          ' login now',
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
