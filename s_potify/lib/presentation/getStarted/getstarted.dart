import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:s_potify/core/config/assets/app_images.dart';
import 'package:s_potify/core/config/assets/app_vectors.dart';
import 'package:s_potify/presentation/modePage/app_mode.dart';

import '../../commons/app_colors.dart';
import '../../commons/widget/s_button.dart';

class Getstarted extends StatelessWidget {
  const Getstarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill, image: AssetImage(AppImages.getStartedBG))),
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
                const Text("Enjoy Listening To Music",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 18)),
                const SizedBox(height: 21),
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sagittis enim purus sed phasellus. Cursus ornare id scelerisque aliquam.",
                  style: TextStyle(color: AppColors.lightGrey, fontSize: 12),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 21,
                ),
                SButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => AppMode()));
                    },
                    title: "Get Started"),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
