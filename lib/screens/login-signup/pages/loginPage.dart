// ignore_for_file: non_constant_identifier_names

import 'package:educat/elements/constants/constants.dart';
import 'package:educat/elements/fonts/myText.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: LayoutBuilder(builder: (context, Constraints) {
        return Container(
          margin: EdgeInsets.only(
            left: Constraints.maxWidth * 0.05,
            top: Constraints.maxHeight * 0.09,
            right: Constraints.maxWidth * 0.05,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                text: 'Login to your\naccount',
                fontSize: 32,
                fontWeight: FontWeight.w800,
              ),
              SizedBox(
                height: Constraints.maxHeight * 0.038,
              ),
              MyText(
                text: 'Email',
                fontSize: 16,
                color: kGreycolor,
              )
            ],
          ),
        );
      }),
    );
  }
}
