// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors
import 'package:educat/elements/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  void Function()? ontap;
  double height;
  Widget? child;
  CustomButton({
    Key? key,
    required this.ontap,
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
              color:kGreencolor,
            ),
            height: height,
            width: double.infinity,
            child: child,
          )),
    );
  }
}
