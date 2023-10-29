import 'package:flutter/material.dart';
import 'package:store_app/services/all_categories_service.dart';

import '../models/product_model.dart';
import '../services/categories_service.dart';
import '../services/get_all_product_service.dart';
import '../widgets/custom_card.dart';
import 'all_products_page.dart';

int selectedIndex = 0;
List categories = [
  "electronics",
  "jewelery",
  "men's clothing",
  "women's clothing"
];

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);
  static String id = 'Category';

  @override
  State<CategoryPage> createState() => _CategoryState();
}

class _CategoryState extends State<CategoryPage> {
  //int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        children: [
          /*          const Padding(
            padding: EdgeInsets.only(left: 18, right: 16, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Category',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                Text(
                  'see all',
                  style: TextStyle(color: Colors.blueGrey, fontSize: 18),
                ),
              ],
            ),
          ),
*/
          FutureBuilder(
              future: AllCategroiesService().getAllCategroies(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  categories = snapshot.data!;
                  return Padding(
                    padding:
                        const EdgeInsets.only(right: 20, left: 20, bottom: 10),
                    child: SizedBox(
                      height: 50,
                      child: ListView.separated(
                        itemCount: categories.length,
                        clipBehavior: Clip.none,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                              print(selectedIndex);
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    categories[index],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: selectedIndex == index
                                            ? Colors.black
                                            : Color(0xFF535353)),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 5),
                                    height: 2,
                                    width: 55,
                                    color: selectedIndex == index
                                        ? Colors.black
                                        : Colors.transparent,
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            const SizedBox(
                          width: 20,
                        ),
                      ),
                    ),
                  );
                } else {
                  return const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                        child: CircularProgressIndicator(
                      color: Color(0xFF535353),
                    )),
                  );
                }
              }),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 14, left: 14, top: 100),
              child: FutureBuilder<List<ProductModel>>(
                  future: AllProductCategroiesService().getCategoriesProducts(
                      categoryName: categories[selectedIndex]),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<ProductModel> products = snapshot.data!;
                      return GridView.builder(
                          itemCount: products.length,
                          clipBehavior: Clip.none,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 1.8,
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
          )
        ],
      ),
    );
    Container(
      height: 2,
      width: 30,
      color: Colors.black,
    );
  }
}
