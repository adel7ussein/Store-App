import 'package:flutter/material.dart';

import '../models/product_model.dart';
import '../services/get_all_product_service.dart';
import '../widgets/custom_card.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({Key? key}) : super(key: key);
  static String id = 'ItemCard';

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 14, left: 14, top: 100),
        child: FutureBuilder<List<ProductModel>>(
            future: AllProductsService().getAllProducts(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<ProductModel> products = snapshot.data!;
                return GridView.builder(
                    itemCount: products.length,
                    clipBehavior: Clip.none,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1.5,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 100),
                    itemBuilder: (context, index) {
                      return CustomCard(
                        product: products[index],
                      );
                    });
              } else {
                return const Center(
                    child: CircularProgressIndicator(
                  color: Color(0xFF3D82AE),
                ));
              }
            }),
      ),
    );
  }
}
