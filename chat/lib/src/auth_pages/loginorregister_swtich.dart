import 'loginpage.dart';
import 'registerpage.dart';
import 'package:flutter/material.dart';

class RegisterOrLogin extends StatefulWidget {
  const RegisterOrLogin({super.key});

  @override
  State<RegisterOrLogin> createState() => _RegisterOrLoginState();
}

class _RegisterOrLoginState extends State<RegisterOrLogin> {
  bool isLogin = true;
  toggleLogin() => {
        setState(() {
          isLogin = !isLogin;
        })
      };
  @override
  Widget build(BuildContext context) {
    return isLogin
        ? Loginpage(
            loginSwitch: toggleLogin,
          )
        : Registerpage(
            loginSwitch: toggleLogin,
          );
  }
}
