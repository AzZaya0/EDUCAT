// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:educat/elements/fonts/myText.dart';
import 'package:flutter/material.dart';

class ContinueGoogle extends StatelessWidget {
  double? height;
  double? width;
  ContinueGoogle({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);
  void onTap() {}
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: const Color(0xB3AAAAAA),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        height: height!,
        width: width!,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'lib/assets/login-images/google.png',
              ),
            ),
            SizedBox(
              width: 10,
            ),
            MyText(
              text: 'Continue With Google',
              fontSize: 18,
              fontWeight: FontWeight.w600,
            )
          ],
        ),
      ),
    );
  }
}
