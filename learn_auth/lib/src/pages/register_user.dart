import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_auth/src/components/my_alertbox.dart';
import 'package:learn_auth/src/components/my_textbox.dart';
import 'package:learn_auth/src/components/mybutton.dart';
import 'package:learn_auth/src/pages/loginpage.dart';
import 'package:learn_auth/src/services/auth_service.dart';

// ignore: must_be_immutable
class RegistrationPage extends StatefulWidget {
  RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  TextEditingController confirmationController = TextEditingController();

  void signIn(BuildContext context) async {
    print('sign In cliked');

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return const Center(child: CircularProgressIndicator());
        });

    try {
      if (confirmationController.text == pwdController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: pwdController.text,
        );
      } else {
        showDialog(
            context: context,
            builder: (context) => const MyAlertbox(
                  message: "Check your password",
                ));
      }
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
                height: 40,
              ),
              const Icon(Icons.lock, color: Colors.black, size: 100),
              const SizedBox(
                height: 40,
              ),
              Text("I am so happy to see you here",
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
              MyTextfield(confirmationController,
                  label: "Confirm Password",
                  hintText: "Please Re-enter your password",
                  obscure: true,
                  icon: false),
              MyButton(
                title: "Sign Up",
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
                      onTap: () => AuthService().signInwithGoogle(),
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
                  const Text("Already have an account ?"),
                  const SizedBox(
                    width: 3,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Loginpage();
                      }));
                    },
                    child: Text(
                      " Login now!",
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
