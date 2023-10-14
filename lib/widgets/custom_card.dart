import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';

class CustomCard extends StatelessWidget {
  CustomCard({super.key,required this.product});
  ProductModel product;

  @override
  Widget build(BuildContext context) {
    return  Stack(
          clipBehavior: Clip.none,
          children:[
             Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2 ),
                blurRadius: 40,
                spreadRadius: 0,
                offset: const Offset(10, 10)
              )
            ]),
            child: Card(
              elevation: 10,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.title.substring(0,7), style: TextStyle(color: Colors.grey,fontSize: 16),),
                    SizedBox(height: 3,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(r'$''${product.price.toString()}', style: TextStyle(fontSize: 16),),
                        Icon(Icons.favorite,color: Colors.red,)
                    
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
             Positioned(
              right: 15,
              top: -60,
              child: Image.network(product.image, height: 100,errorBuilder: (context, error, stackTrace) {
               return const Text('No Image');
              },))
          ]
        );
  }
}