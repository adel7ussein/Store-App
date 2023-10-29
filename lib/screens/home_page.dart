import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/screens/all_products_page.dart';

import 'category_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static String id = 'HomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  FontAwesomeIcons.cartPlus,
                  color: Colors.white,
                ))
          ],
          backgroundColor: Color(0xFF3D82AE),
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'New Trend',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Category(),
            Padding(
              padding: const EdgeInsets.only(left: 14),
              child: Card(
                elevation: 2,
                child: Container(
                  width: 100,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Center(
                      child: Text(
                    'all products',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  )),
                ),
              ),
            ),
            const ItemCard(),
          ],
        ));
  }
}
