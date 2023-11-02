import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/screens/home_page.dart';
import 'package:store_app/screens/update_product_page.dart';

import '../models/product_model.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);
  static String id = 'Detail Screen';

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFF3D82AE),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                FontAwesomeIcons.magnifyingGlass,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                FontAwesomeIcons.cartPlus,
                color: Colors.white,
              )),
        ],
        elevation: 0,
        backgroundColor: Color(0xFF3D82AE),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context, HomePage.id);
          },
          icon: Icon(FontAwesomeIcons.arrowLeft),
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height,
              child: Stack(children: [
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(top: 50, right: 20, left: 20),
                  height: 500,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24))),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  'rating',
                                  style: TextStyle(
                                      color: Color(0xFF535353), fontSize: 20),
                                ),
                                Text(product.rating.rate.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium!
                                        .copyWith(
                                            color: Color(0xFF535353),
                                            fontWeight: FontWeight.bold))
                              ],
                            ),
                            SizedBox(
                              width: 80,
                            ),
                            Column(
                              children: [
                                Text(
                                  'count',
                                  style: TextStyle(
                                      color: Color(0xFF535353), fontSize: 20),
                                ),
                                Text(product.rating.count.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium!
                                        .copyWith(
                                            color: Color(0xFF535353),
                                            fontWeight: FontWeight.bold))
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            product.description,
                            style: TextStyle(
                                color: Color(0xFF535353), height: 1.2),
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 15),
                              height: 50,
                              width: 58,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFF535353)),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    FontAwesomeIcons.cartPlus,
                                  )),
                            ),
                            SizedBox(
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFF3D82AE)),
                                child: Text(
                                  'Buy Now'.toUpperCase(),
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            const SizedBox(width: 15,),
                            SizedBox(
                              height: 50,
                              width: 120,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, UpdateProductPage.id, arguments: product);
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFF3D82AE)),
                                child: Text(
                                  'Update'.toUpperCase(),
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title,
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      Text(product.category,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                      Padding(
                        padding: const EdgeInsets.only(top: 25, bottom: 65),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Price',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                                Text(
                                  r'$' '${product.price}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            Image.network(
                              product.image,
                              width: 150,
                              height: 150,
                              fit: BoxFit.fill,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
