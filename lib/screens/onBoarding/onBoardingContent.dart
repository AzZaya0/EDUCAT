// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:educat/elements/fonts/myText.dart';
import 'package:educat/screens/login-signup/elements/customButton.dart';

class OnboardingContent extends StatelessWidget {
  String image, title, description;

  OnboardingContent(
      {Key? key,
      required this.image,
      required this.title,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, Constraints) {
        return SafeArea(
          child: Container(
            margin: EdgeInsets.only(
                top: Constraints.maxHeight * 0.03,
                left: Constraints.maxWidth * 0.03,
                bottom: Constraints.maxHeight * 0.04,
                right: Constraints.maxWidth * 0.03),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  image,
                  height: Constraints.maxHeight * 0.6,
                ),
                MyText(
                  text: title,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
                Center(
                  child: MyText(
                      textAlign: TextAlign.center,
                      text: description,
                      fontSize: 15),
                ),
                Spacer(),
              ],
            ),
          ),
        );
      }),
    );
  }
}
