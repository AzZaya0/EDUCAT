// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors
import 'package:flutter/material.dart';



class CustomButton extends StatelessWidget {
  void Function()? ontap;
  Color? color;
  double height;
  Widget? child;
  CustomButton({
    Key? key,
    required this.ontap,
    this.color,
    required this.height,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
          onTap: ontap,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: color,
            ),
            height: height,
            width: double.infinity,
            child: child,
          )),
    );
  }
}
