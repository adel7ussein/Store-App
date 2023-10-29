import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:store_app/widgets/custom_on_boarding.dart';

import '../helper/shared_boolean.dart';
import 'home_page.dart';


class OnBoarding extends StatefulWidget {

  OnBoarding({Key? key}) : super(key: key);
  static String id = 'OnBoarding Page';


  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  //controller keep track which page we are on
  PageController _controller = PageController();
  int currentIndex = 0;

  //keep track if we are on the last page or not
 // bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
          PageView(
            controller: _controller,
            onPageChanged: (index){
              setState(() {
                isLastPage = (index == 2);
                currentIndex = index;
              });
            },
            children: [
              CustomOnBoarding(imagePath: 'assets/images/sc1.png'),
              CustomOnBoarding(imagePath: 'assets/images/sc2.png'),
              CustomOnBoarding(imagePath: 'assets/images/sc3.png'),
            ],
          ),
          Container(
              alignment: Alignment(0, 0.75),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                      onTap : (){
                        _controller.jumpToPage(2);
                      },
                      child: Text('Skip',style: TextStyle(fontWeight: FontWeight.bold),)),
                  AnimatedSmoothIndicator( count: 3, activeIndex: currentIndex,),
                  isLastPage ?
                  GestureDetector(
                      onTap: (){
                        Navigator.pushReplacement(context,  MaterialPageRoute(builder: (context) => HomePage()),
                        );
                        setState(() {
                          saveBool();
                        });
                      },
                      child: Text('done',style: TextStyle(fontWeight: FontWeight.bold)))

                      :
                  GestureDetector(
                      onTap: (){
                        _controller.nextPage(duration: Duration(microseconds: 500), curve: Curves.easeIn);
                      },
                      child: Text('Next',style: TextStyle(fontWeight: FontWeight.bold))),
                ],
              ))
        ]));

  }

}
