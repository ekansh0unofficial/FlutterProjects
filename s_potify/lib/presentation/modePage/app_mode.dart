import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:s_potify/core/config/assets/app_images.dart';
import 'package:s_potify/core/config/assets/app_vectors.dart';
import 'package:s_potify/presentation/auth/login_register.dart';
import 'package:s_potify/presentation/modePage/bloc/theme_cubit.dart';

import '../../commons/widget/s_button.dart';

class AppMode extends StatelessWidget {
  const AppMode({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: Scaffold(
          body: Stack(children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AppImages.themeBG), fit: BoxFit.fill)),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24.0, 24.0, 24, 28),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: SvgPicture.asset(
                    AppVectors.logo,
                    height: 60,
                  ),
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            context
                                .read<ThemeCubit>()
                                .updateTheme(ThemeMode.dark);
                          },
                          style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              backgroundColor: Colors.white.withOpacity(0.01)),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SvgPicture.asset(AppVectors.moon),
                          ),
                        ),
                        const Text(
                          "Dark Mode",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w300),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              context
                                  .read<ThemeCubit>()
                                  .updateTheme(ThemeMode.dark);
                            },
                            style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                backgroundColor:
                                    Colors.white.withOpacity(0.01)),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: SvgPicture.asset(AppVectors.sun),
                            )),
                        const Text("Light Mode",
                            style: TextStyle(color: Colors.white)),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                SButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                LoginRegister()));
                  },
                  title: "Continue",
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        )
      ])),
    );
  }
}
