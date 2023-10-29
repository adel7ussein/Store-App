import 'package:flutter/material.dart';
import 'package:store_app/screens/detail_page.dart';
import 'package:store_app/screens/home_page.dart';
import 'package:store_app/screens/on_boarding_page.dart';
import 'package:store_app/screens/all_products_page.dart';
import 'package:store_app/screens/update_product_page.dart';
import '../helper/shared_boolean.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await getBool();
  runApp(const StoreApp());

}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.id :(context) =>  HomePage(),
        UpdateProductPage.id :(context) => UpdateProductPage(),
        OnBoarding.id : (context) => OnBoarding(),
        ItemCard.id : (context) => ItemCard(),
        DetailScreen.id : (context) => DetailScreen(),
      },
      initialRoute: isLastPage ? HomePage.id : OnBoarding.id,
    );
  }
}
