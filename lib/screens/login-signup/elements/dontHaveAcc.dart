import 'package:educat/elements/constants/constants.dart';
import 'package:educat/elements/fonts/myText.dart';
import 'package:educat/screens/login-signup/pages/signupPage.dart';
import 'package:flutter/material.dart';

class signup extends StatelessWidget {
  const signup({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyText(
          text: 'Don\'t have an account?',
          fontSize: 18,
          color: Colors.grey.shade600,
        ),
        InkWell(
          splashColor: null,
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return SignupPage();
            }));
          },
          child: MyText(
            text: ' Sign up',
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: kGreencolor,
          ),
        )
      ],
    );
  }
}
