import 'package:flutter/material.dart';
import 'package:grocery_store/src/data/models%20/product.dart';
import 'package:grocery_store/src/feature/home/bloc/home_bloc.dart';

// ignore: must_be_immutable
class ProductTile extends StatelessWidget {
  Product product;
  ProductTile({super.key, required this.product});
  final bloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Expanded(
        child: Card(
            color: const Color.fromARGB(255, 235, 234, 234),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Image.network(
                    product.imageUrl,
                    fit: BoxFit.fill,
                    height: 200,
                  ),
                ),
                Padding(
                    padding:
                        const EdgeInsets.only(left: 24, top: 12, right: 24),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(product.name,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Expanded(flex: 1, child: Container()),
                        Text('${product.price}',
                            style: const TextStyle(fontWeight: FontWeight.w500))
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 24.0),
                  child: Text(
                    product.description,
                    textAlign: TextAlign.left,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.shopping_cart_outlined),
                        onPressed: () {
                          bloc.add(OnClickCart());
                        },
                      ),
                      IconButton(
                          onPressed: () {
                            bloc.add(OnClickFav());
                          },
                          icon: const Icon(Icons.favorite_outline))
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
