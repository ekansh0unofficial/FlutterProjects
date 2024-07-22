import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_store/src/feature/home/bloc/home_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var bloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: bloc,
      listenWhen: (previous, current) {
        return true;
      },
      buildWhen: (previous, current) {
        return true;
      },
      listener: (context, state) {},
      builder: (context, state) {
        return Container();
      },
    );
  }
}
