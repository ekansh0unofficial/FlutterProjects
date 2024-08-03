import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_store/src/feature/favourite/bloc/fav_bloc.dart';

import '../../cart/view/cart.dart';
import '../../home/view/home.dart';

class Favourite extends StatefulWidget {
  const Favourite({super.key});

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  late var bloc;

  @override
  void initState() {
    bloc = FavBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavBloc, FavState>(
      bloc: bloc,
      listenWhen: (previous, current) => current is FavActionState,
      buildWhen: (previous, current) => current is! FavActionState,
      listener: (context, state) {
        if (state is FavToCartNavigatingState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Cart()));
        }
        if (state is FavToHomeNavigatingState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Home()));
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Grocery Shop Favorites"),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 32.0),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          bloc.add(OnNavigatingFavTOCart());
                        },
                        icon: const Icon(Icons.shopping_bag, size: 32)),
                    IconButton(
                        onPressed: () {
                          bloc.add(OnNavigatingFavTOHome());
                        },
                        icon: const Icon(Icons.home, size: 32)),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
