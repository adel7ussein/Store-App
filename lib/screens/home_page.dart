import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/all_category_widget.dart';
import '../widgets/all_products_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static String id = 'HomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                FontAwesomeIcons.cartPlus,
                color: Colors.black,
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
      body: IndexedStack(
        index: currentIndex,
        children: const [
          ItemCard(),
          CategoryPage(),
          Center(child: Text('Favorite')),
          Center(child: Text('Add a Product'))
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        backgroundColor: Colors.white,
        color: const Color(0xFF3D82AE),
        buttonBackgroundColor: Colors.white,
        index: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          Icon(Icons.home),
          Icon(Icons.category_outlined),
          Icon(
            Icons.favorite,
          ),
          Icon(
            Icons.add,
          ),
        ],
      ),
    );
  }
}
