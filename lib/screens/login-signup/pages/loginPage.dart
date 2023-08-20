// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously
import 'package:educat/elements/constants/constants.dart';
import 'package:educat/elements/fonts/myText.dart';
import 'package:educat/provider/loginProvider.dart';
import 'package:educat/screens/login-signup/elements/customButton.dart';
import 'package:educat/screens/login-signup/elements/dontHaveAcc.dart';
import 'package:educat/screens/login-signup/elements/textBox.dart';
import 'package:educat/screens/login-signup/pages/signupPage.dart';
import 'package:educat/screens/login-signup/services/authPage.dart';
import 'package:educat/screens/login-signup/services/googleSignin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    //>>>>>>>>>>>>>>>>>>>>>>>> provider <<<<<<<<<<<<<<<<<<<<<<<<<<<<

    final loginnProvider = Provider.of<LoginProvider>(context, listen: false);
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
                text: '  Email',
                fontSize: 16,
                color: kGreycolor,
              ),
              SizedBox(
                height: Constraints.maxHeight * 0.02,
              ),
              TextBox(
                  text: 'Your email',
                  obsecureText: false,
                  controller: loginnProvider.email),
              SizedBox(
                height: Constraints.maxHeight * 0.038,
              ),
              MyText(
                text: '  Password',
                fontSize: 16,
                color: kGreycolor,
              ),
              SizedBox(
                height: Constraints.maxHeight * 0.02,
              ),

              //>>>>>>>>>>>>>>>>>>>>>>>>>>>> Adding consumer to access provider  <<<<<<<<<<<<<<<<<<<<<<<<<<
              Consumer<LoginProvider>(builder: ((context, value, child) {
                return TextBox(
                    suffixIcon: GestureDetector(
                      onTap: () {
                        value.eyeButton();
                      },
                      child: Icon(
                        value.obsecure
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: kGreycolor,
                      ),
                    ),
                    text: 'Your password',
                    obsecureText: value.obsecure,
                    controller: loginnProvider.pass);
              })),
              SizedBox(
                height: Constraints.maxHeight * 0.02,
              ),
              Padding(
                padding: EdgeInsets.only(left: Constraints.maxWidth * 0.40),
                child: MyText(
                  text: 'Forgot your password?',
                  fontSize: 18,
                  color: kMainColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: Constraints.maxHeight * 0.03,
              ),
              CustomButton(
                  color: kMainColor,
                  ontap: () {
                    loginnProvider.SignIn(context);
                  },
                  height: Constraints.maxHeight * 0.07,
                  child: MyText(
                    text: 'Sign in',
                    fontSize: 19,
                    color: Colors.white,
                  )),
              SizedBox(
                height: Constraints.maxHeight * 0.04,
              ),
              Center(
                child: MyText(
                  text: 'or continue with',
                  fontSize: 18,
                  color: kGreycolor,
                ),
              ),
              SizedBox(
                height: Constraints.maxHeight * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'lib/assets/login-images/facebook.png',
                    height: Constraints.maxHeight * 0.06,
                  ),
                  SizedBox(
                    width: Constraints.maxWidth * 0.05,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      GoogleSignin().signInWithGoogle();
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return AuthPage();
                      }));
                    },
                    child: Image.asset(
                      'lib/assets/login-images/google.png',
                      height: Constraints.maxHeight * 0.06,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Constraints.maxHeight * 0.05,
              ),
              Signup(),
            ],
          ),
        );
      }),
    );
  }
}
