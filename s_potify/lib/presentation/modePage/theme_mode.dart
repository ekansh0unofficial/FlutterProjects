import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:s_potify/core/config/assets/app_images.dart';
import 'package:s_potify/core/config/assets/app_vectors.dart';

import '../../commons/widget/s_button.dart';

class ThemeMode extends StatelessWidget {
  const ThemeMode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(AppImages.themeBG))),
      ),
      SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 24.0, 24, 28),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: SvgPicture.asset(AppVectors.logo),
              ),
              const Spacer(),
              const Text('Choose Mode',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 18)),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Column(
                    children: [
                      ElevatedButton(
                          onPressed: () {},
                          child: SvgPicture.asset(AppVectors.moon)),
                      Text("Dark Mode")
                    ],
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                          onPressed: () {},
                          child: SvgPicture.asset(AppVectors.sun)),
                      Text("Light Mode"),
                    ],
                  )
                ],
              ),
              SButton(
                onPressed: () {},
                title: "Continue",
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      )
    ]));
  }
}
