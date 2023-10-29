import 'package:flutter/material.dart';

import '../models/product_model.dart';

class CustomContainer extends StatelessWidget {
  CustomContainer({Key? key, required this.product}) : super(key: key);
  ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              child: Image.network(
                product.image,
                height: 100,
                width: 100,
                errorBuilder: (context, error, stackTrace) {
                  return const Text('No Image');
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '${product.title.substring(0, 8)}',
                      style: const TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    Text(
                      r'$ ' '${product.price}',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                const Icon(
                  Icons.favorite,
                  color: Colors.red,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
