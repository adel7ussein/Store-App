import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/screens/home_page.dart';
import 'package:store_app/screens/update_product_page.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_different_text_widgets.dart';

import '../models/product_model.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);
  static String id = 'Detail Screen';

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    Size size = MediaQuery.of(context).size;
    TextStyle textStyle = Theme.of(context)
        .textTheme
        .headlineMedium!
        .copyWith(color: Color(0xFF535353), fontWeight: FontWeight.bold);
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
                            CustomColumn(
                              text: 'rating',
                              valueOfText: product.rating.rate.toString(),
                              colorValueOfText: Color(0xFF535353),
                              colorOfText: Color(0xFF535353),
                              fontSize: 20,
                            ),
                            SizedBox(
                              width: 80,
                            ),
                            CustomColumn(
                              text: 'count',
                              valueOfText: product.rating.count.toString(),
                              colorValueOfText: Color(0xFF535353),
                              colorOfText: Color(0xFF535353),
                              fontSize: 20,
                            )
                          ],
                        ),
                        Description(
                          description: product.description,
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
                            CustomElevatedButton(
                                onPressed: () {}, titleButton: 'Buy Now'),
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                                child: CustomElevatedButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, UpdateProductPage.id,
                                          arguments: product);
                                    },
                                    titleButton: 'Update')),
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
                      CustomText(
                          customText: product.title,
                          color: Colors.white,
                          fontSize: 15),
                      CustomValueOfText(
                          textValue: product.category, color: Colors.white),
                      Padding(
                        padding: const EdgeInsets.only(top: 25, bottom: 65),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                CustomText(
                                    customText: 'Price',
                                    color: Colors.white,
                                    fontSize: 15),
                                CustomValueOfText(
                                    textValue: r'$' '${product.price}',
                                    color: Colors.white)
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
