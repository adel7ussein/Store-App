import 'dart:ui';

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({this.inputType ,this.hintText,this.onChanged,
  this.icon, this.isObscureText =false});
  String ? hintText;
  Function(String)? onChanged;
  String? fieldMessage;
  Widget? icon;
  bool isObscureText;
  TextInputType ? inputType;
  @override
  Widget build(BuildContext context) {
    return   TextField(
      onChanged: onChanged ,
      keyboardType : inputType,
      obscureText: isObscureText ,
      decoration: InputDecoration(
          suffixIcon: icon,
          hintText: hintText,
          focusedBorder:OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.black,)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
              ),
              borderRadius: BorderRadius.circular(10)
          ),

          border: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.white
              ),
              borderRadius: BorderRadius.circular(10),
              
          )
      ),
    );
  }
}