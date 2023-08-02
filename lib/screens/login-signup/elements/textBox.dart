// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../elements/constants/constants.dart';

class TextBox extends StatelessWidget {
  Widget? suffixIcon;
  String text;
  bool obsecureText;
  TextEditingController controller;
  TextBox({
    Key? key,
    this.suffixIcon,
    required this.text,
    required this.obsecureText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obsecureText,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
          hintText: text,
          hintStyle: TextStyle(color: kGreycolor),
          fillColor: kTextBoxColor,
          filled: true,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(12))),
    );
  }
}
