import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:s_potify/core/config/assets/app_images.dart';
import 'package:s_potify/core/config/assets/app_vectors.dart';

class LoginRegister extends StatelessWidget {
  const LoginRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: SvgPicture.asset(AppVectors.topUiComponent),
        ),
        Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset(AppVectors.bottomUiComponent)),
        Align(
          alignment: Alignment.bottomLeft,
          child: Image.asset(AppImages.loginOrRegisterBG),
        )
      ],
    ));
  }
}
