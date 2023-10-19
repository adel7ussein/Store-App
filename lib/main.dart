import 'package:flutter/material.dart';
import 'package:store_app/screens/home_page.dart';
import 'package:store_app/screens/update_product_page.dart';

void main() {
  runApp(const StoreApp());

  //List<int> ages = [29, 27, 42];
    // the arguement that forEach expects is 
    // a *call back*. This function will be called on
    // each element
   // ages.forEach((int age) => print(age));

}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.id :(context) => const HomePage(),
        UpdateProductPage.id :(context) => UpdateProductPage()
      },
      initialRoute: HomePage.id,
    );
  }
}
