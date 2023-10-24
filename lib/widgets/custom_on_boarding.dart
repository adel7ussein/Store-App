import 'package:flutter/material.dart';

class CustomOnBoarding extends StatelessWidget {
   CustomOnBoarding({Key? key,required this.imagePath}) : super(key: key);
  String imagePath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 150,),
          Image.asset(imagePath),
          SizedBox(height: 70,),
          Text('Screen Title', style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
          SizedBox(height: 10,),
          Text('Screen Body', style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),



        ],
      ),
    );
  }
}
