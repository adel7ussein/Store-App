import 'package:flutter/material.dart';

class CustomValueOfText extends StatelessWidget {
  CustomValueOfText({Key? key, required this.textValue, required this.color})
      : super(key: key);
  String textValue;
  Color color;
  @override
  Widget build(BuildContext context) {
    return Text(textValue,
        style: Theme.of(context)
            .textTheme
            .headlineMedium!
            .copyWith(color: color, fontWeight: FontWeight.bold));
  }
}

class CustomColumn extends StatelessWidget {
  CustomColumn(
      {Key? key,
      required this.text,
      required this.valueOfText,
      required this.colorValueOfText,
      required this.fontSize,
      required this.colorOfText})
      : super(key: key);
  String text;
  String valueOfText;
  Color colorValueOfText;
  Color colorOfText;
  double fontSize;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          customText: text,
          color: colorOfText,
          fontSize: fontSize,
        ),
        CustomValueOfText(
          textValue: valueOfText,
          color: colorValueOfText,
        ),
      ],
    );
  }
}

class CustomText extends StatelessWidget {
  CustomText(
      {Key? key,
      required this.customText,
      required this.color,
      required this.fontSize})
      : super(key: key);
  String customText;
  Color color;
  double fontSize;
  @override
  Widget build(BuildContext context) {
    return Text(
      customText,
      style: TextStyle(color: color, fontSize: fontSize),
    );
  }
}

class Description extends StatelessWidget {
  Description({Key? key, required this.description}) : super(key: key);
  String description;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Text(
        description,
        style: const TextStyle(color: Color(0xFF535353), height: 1.2),
      ),
    );
  }
}
