import 'package:educat/elements/fonts/myText.dart';
import 'package:educat/screens/login-signup/elements/google.dart';
import 'package:flutter/material.dart';


class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(builder: (context, Constraints) {
          return Container(
            margin: EdgeInsets.only(
              left: Constraints.maxWidth * 0.05,
              top: Constraints.maxHeight * 0.05,
              right: Constraints.maxWidth * 0.05,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                  text: 'Welcome to',
                  fontSize: 20,
                  color: Color(0xff24252D),
                ),
                MyText(
                  text: 'Educat',
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF24252D),
                ),
                Center(
                  child: Image.asset(
                    'lib/assets/login-images/welcome.png',
                    height: Constraints.maxHeight * 0.5,
                  ),
                ),
                ContinueGoogle(
                  height: Constraints.maxHeight * 0.07,
                  width: Constraints.maxWidth,
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
