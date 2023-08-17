// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously
import 'package:educat/elements/constants/constants.dart';
import 'package:educat/elements/fonts/myText.dart';
import 'package:educat/screens/login-signup/elements/customButton.dart';
import 'package:educat/screens/login-signup/elements/dontHaveAcc.dart';
import 'package:educat/screens/login-signup/elements/textBox.dart';
import 'package:educat/screens/login-signup/services/authPage.dart';
import 'package:educat/screens/login-signup/services/googleSignin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void SignIn() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passController.text,
      );
      Navigator.pop(context);
    } on FirebaseException catch (e) {
      Navigator.pop(context);
      showError(e.code);
    }
  }

  void showError(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            insetAnimationDuration: const Duration(milliseconds: 200),
            title: Center(
              child: MyText(
                text: message,
                fontSize: 24,
                color: Colors.white,
              ),
            ),
          );
        });
  }

  final emailController = TextEditingController();
  final passController = TextEditingController();

  bool _obsecureText = true;
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
                  controller: emailController),
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
              TextBox(
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _obsecureText = !_obsecureText;
                      });
                    },
                    child: Icon(
                      _obsecureText ? Icons.visibility_off : Icons.visibility,
                      color: kGreycolor,
                    ),
                  ),
                  text: 'Your password',
                  obsecureText: _obsecureText,
                  controller: passController),
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
                  ontap: SignIn,
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
