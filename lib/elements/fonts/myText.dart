// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class MyText extends StatelessWidget {
  TextAlign? textAlign;
  String text;
  double fontSize;
  Color? color;
  double? letterSpacing;
  FontWeight? fontWeight;
  MyText({
    Key? key,
    this.textAlign,
    required this.text,
    required this.fontSize,
    this.color,
    this.letterSpacing,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      
      text,
      textAlign: textAlign,
      style: GoogleFonts.workSans(
        textStyle: TextStyle(
          
            letterSpacing: letterSpacing,
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight),
            
      ),
    );
  }
}
