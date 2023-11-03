import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      this.inputType,
      this.hintText,
      this.onChanged,
      this.icon,
      this.isObscureText = false});
  String? hintText;
  Function(String)? onChanged;
  String? fieldMessage;
  Widget? icon;
  bool isObscureText;
  TextInputType? inputType;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      onChanged: onChanged,
      keyboardType: inputType,
      obscureText: isObscureText,
      decoration: InputDecoration(
          suffixIcon: icon,
          hintText: hintText,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Color(0xFF3D82AE))),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(),
              borderRadius: BorderRadius.circular(10)),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          )),
    );
  }
}
