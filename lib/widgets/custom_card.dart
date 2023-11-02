import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/screens/detail_page.dart';
import 'package:store_app/screens/update_product_page.dart';

class CustomCard extends StatefulWidget {
  CustomCard({super.key, required this.product});
  ProductModel product;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  bool isFavorite = false ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, DetailScreen.id, arguments: widget.product); //UpdateProductPage.id
      },
      child: Stack(clipBehavior: Clip.none, children: [
        Container(
          width: 250,
          height: 400,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 40,
                spreadRadius: 0,
                offset: const Offset(10, 10))
          ]),
          child: Card(
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${widget.product.title.substring(0, 8)}',
                    style: const TextStyle(color: Color(0xFF535353), fontSize: 16),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        r'$ ' '${widget.product.price}',
                        style: const TextStyle(fontSize: 16),
                      ),
                       GestureDetector(
                         onTap: (){
                           setState(() {
                             isFavorite = !isFavorite;
                           });
                         },
                         child: Icon(
                           isFavorite ? Icons.favorite :
                           FontAwesomeIcons.heart,  // Color(0xFF535353)
                          color: Color(0xFF535353),
                      ),
                       )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
            right: 30,
            top: -65,
            child: Image.network(
              widget.product.image,
              height: 100,
              width: 100,
              errorBuilder: (context, error, stackTrace) {
                return const Text('No Image');
              },
            ))
      ]),
    );
  }
}
