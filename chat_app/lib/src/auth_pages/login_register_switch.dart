import 'package:chat_app/src/auth_pages/loginpage.dart';
import 'package:chat_app/src/auth_pages/registrationpage.dart';
import 'package:flutter/material.dart';

class LoginOrRegister extends StatefulWidget {
  LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool isLogin = true;

  void switchBool() {
    setState(() {
      isLogin = !isLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLogin
        ? Loginpage(onTap: switchBool)
        : RegisterPage(onTap: switchBool);
  }
}
