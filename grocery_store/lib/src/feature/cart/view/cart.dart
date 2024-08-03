import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_store/src/feature/favourite/view/fav.dart';
import 'package:grocery_store/src/feature/home/view/home.dart';

import '../bloc/cart_bloc.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  late var bloc;
  @override
  void initState() {
    bloc = CartBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
      bloc: bloc,
      listenWhen: (previous, current) => current is CartActionState,
      buildWhen: (previous, current) => current is! CartActionState,
      listener: (context, state) {
        if (state is CartToFavoritesNavigationState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Favourite()));
        }
        if (state is CartToHomeNavigationState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Home()));
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Grocery Shop"),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 32.0),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          bloc.add(OnNavCartTOFav());
                        },
                        icon: const Icon(Icons.favorite, size: 32)),
                    IconButton(
                        onPressed: () {
                          bloc.add(OnNavCartTOHome());
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
