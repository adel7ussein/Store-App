import 'package:flutter/material.dart';

class CustomOnBoarding extends StatelessWidget {
  CustomOnBoarding(
      {Key? key,
      required this.imagePath,
      required this.titleScreen,
      required this.bodyScreen})
      : super(key: key);
  String imagePath;
  String titleScreen;
  String bodyScreen;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 150,
          ),
          Image.asset(imagePath),
          const SizedBox(
            height: 70,
          ),
          Text(
            titleScreen,
            style: const TextStyle(
                color: Color(0xFF535353),
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            bodyScreen,
            style: const TextStyle(
                color: Color(0xFF535353),
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
