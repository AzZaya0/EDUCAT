// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:educat/elements/fonts/myText.dart';

class OnboardingContent extends StatelessWidget {
  String image, title, description;
  double height;

  OnboardingContent(
      {Key? key,
      required this.height,
      required this.image,
      required this.title,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              image,
              height: height,
            ),
            MyText(
              text: title,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
            Center(
              child: MyText(
                  textAlign: TextAlign.center, text: description, fontSize: 15),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
