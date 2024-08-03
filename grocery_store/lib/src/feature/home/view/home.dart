import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_store/src/feature/favourite/view/fav.dart';
import 'package:grocery_store/src/feature/home/bloc/home_bloc.dart';
import 'package:grocery_store/src/feature/home/view/hometile.dart';

import '../../cart/view/cart.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final bloc;

  @override
  void initState() {
    bloc = HomeBloc();
    super.initState();
    bloc.add(FetchHome());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: bloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeToCartState) {
          print('moving to cart');
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Cart()));
        } else if (state is HomeToFavState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Favourite()));
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
                          bloc.add(OnNavigateFav());
                        },
                        icon: const Icon(Icons.favorite, size: 32)),
                    IconButton(
                        onPressed: () {
                          bloc.add(OnNavigateCart());
                        },
                        icon: const Icon(Icons.shopping_bag, size: 32)),
                  ],
                ),
              )
            ],
          ),
          body: Builder(builder: (context) {
            switch (state.runtimeType) {
              case const (HomeLoading):
                return const Center(child: CircularProgressIndicator());
              case const (HomeLoadSuccess):
                final sucessState = state as HomeLoadSuccess;
                return GridView.builder(
                    itemCount: sucessState.products.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return ProductTile(product: sucessState.products[index]);
                    });
              case HomeError:
                return const Center(child: Text('Failed to load home data'));
              default:
                return const Center(child: Text('Unknown state'));
            }
          }),
        );
      },
    );
  }
}


// ListView.builder(
//                   itemCount: sucessState.products.length,
//                   itemBuilder: (context, index) {
//                     return Text('${sucessState.products[index].name} ',
//                         style: TextStyle(color: Colors.black));
//                   },
//                 )