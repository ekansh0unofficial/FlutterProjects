import 'package:flutter/material.dart';
import 'package:grocery_store/src/data/models%20/product.dart';

// ignore: must_be_immutable
class ProductTile extends StatelessWidget {
  Product product;
  ProductTile({super.key, required this.product});

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
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                        maxHeight: 200,
                        minHeight: 50,
                        maxWidth: 200,
                        minWidth: 50),
                    child: Image.network(product.imageUrl, fit: BoxFit.fill),
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
                )
              ],
            )),
      ),
    );
  }
}
