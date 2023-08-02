// ignore: file_names
import 'package:educat/elements/constants/constants.dart';
import 'package:educat/elements/fonts/myText.dart';
import 'package:educat/screens/login-signup/elements/continueWith.dart';
import 'package:educat/screens/login-signup/elements/customButton.dart';
import 'package:educat/screens/login-signup/pages/loginPage.dart';
import 'package:educat/screens/login-signup/services/googleSignin.dart';
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
          return SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(
                left: Constraints.maxWidth * 0.05,
                top: Constraints.maxHeight * 0.05,
                right: Constraints.maxWidth * 0.05,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //welcome to educat & welcome image section
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

                  // CONTINUE-WITH SECTION
                  ContinueWith(
                    onTap: null,
                    text: 'Continue With Facebook',
                    height: Constraints.maxHeight * 0.07,
                    width: Constraints.maxWidth,
                    child: Image.asset(
                      'lib/assets/login-images/facebook.png',
                    ),
                  ),
                  SizedBox(
                    height: Constraints.maxHeight * 0.02,
                  ),
                  ContinueWith(
                    onTap: () {
                      GoogleSignin().signInWithGoogle();
                    },
                    text: 'Continue With Google     ',
                    height: Constraints.maxHeight * 0.07,
                    width: Constraints.maxWidth,
                    child: Image.asset(
                      'lib/assets/login-images/google.png',
                    ),
                  ),
                  SizedBox(
                    height: Constraints.maxHeight * 0.01,
                  ),
                  Center(
                    child: MyText(
                      text: 'or',
                      fontSize: 18,
                      color: Colors.grey.shade500,
                    ),
                  ),
                  SizedBox(
                    height: Constraints.maxHeight * 0.02,
                  ),

                  // LOGIN-BUTTON SECTION
                  CustomButton(
                      ontap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return const LoginPage();
                          }),
                        );
                      },
                      height: Constraints.maxHeight * 0.079,
                      child: MyText(
                        text: 'Login',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      )),

                  SizedBox(
                    height: Constraints.maxHeight * 0.02,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyText(
                        text: 'Don\'t have an account?',
                        fontSize: 18,
                        color: Colors.grey.shade600,
                      ),
                      InkWell(
                        splashColor: null,
                        onTap: () {},
                        child: MyText(
                          text: ' Sign up',
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: kGreencolor,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
