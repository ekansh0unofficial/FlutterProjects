import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_auth/src/components/my_alertbox.dart';
import 'package:learn_auth/src/components/my_textbox.dart';
import 'package:learn_auth/src/components/mybutton.dart';
import 'package:learn_auth/src/pages/register_user.dart';
import 'package:learn_auth/src/services/auth_service.dart';

// ignore: must_be_immutable
class Loginpage extends StatefulWidget {
  Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();

  void signIn(BuildContext context) async {
    print('sign In cliked');

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return Center(child: const CircularProgressIndicator());
        });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: pwdController.text,
      );
    } on FirebaseAuthException catch (e) {
      print(e.code);
      if (e.code == 'invalid-credential') {
        Navigator.pop(context);
        showDialog(
            context: context,
            builder: (context) {
              return const MyAlertbox(message: "You Entered Wrong Password");
            });
      } else if (e.code == 'invalid-email') {
        Navigator.pop(context);
        showDialog(
            context: context,
            builder: (context) {
              return const MyAlertbox(
                message: "User not found ,Try again Later ",
              );
            });
      } else {
        Navigator.pop(context);
        showDialog(
            context: context,
            builder: (context) {
              return MyAlertbox();
            });
      }
      return;
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 80,
              ),
              const Icon(Icons.lock, color: Colors.black, size: 100),
              const SizedBox(
                height: 40,
              ),
              Text("Welcome back , So excited to see you again ",
                  style: TextStyle(
                      color: Colors.grey[900],
                      fontFamily: GoogleFonts.roboto.toString(),
                      fontSize: 16)),
              MyTextfield(
                emailController,
                label: "Email",
                hintText: "Enter your email",
                icon: false,
              ),
              MyTextfield(
                pwdController,
                label: "Password",
                hintText: "Keep your password private",
                obscure: true,
                icon: true,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 2, 25, 0),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: GestureDetector(
                    onTap: () {
                      print("Widget clicked");
                    },
                    child: const Text(
                      'forgot your password?',
                      style: TextStyle(
                          decoration: TextDecoration.underline, fontSize: 14),
                    ),
                  ),
                ),
              ),
              MyButton(
                title: "Sign In",
                onTap: () => signIn(context),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(32.0, 0, 32.0, 0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[500],
                        height: 0.5,
                      ),
                    ),
                    const Text(' or continue with '),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[500],
                        height: 0.5,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        return AuthService().signInwithGoogle();
                      },
                      child: Image.asset(
                        "assets/images/google.png",
                        height: 60,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Image.asset(
                        "assets/images/apple.png",
                        height: 60,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Not a member ?"),
                  const SizedBox(
                    width: 3,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return RegistrationPage();
                      }));
                    },
                    child: Text(
                      "Register now!",
                      style: TextStyle(color: Colors.blue[300]),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
