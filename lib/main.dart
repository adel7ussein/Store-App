import 'package:flutter/material.dart';
import 'package:store_app/screens/home_page.dart';
import 'package:store_app/screens/on_boarding_page.dart';
import 'package:store_app/screens/update_product_page.dart';
import '../helper/shared_boolean.dart';

void main() {
  runApp(const StoreApp());

}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.id :(context) => const HomePage(),
        UpdateProductPage.id :(context) => UpdateProductPage(),
        OnBoarding.id : (context) => OnBoarding()
      },
      initialRoute: isLastPage ? HomePage.id : OnBoarding.id,
    );
  }
}
