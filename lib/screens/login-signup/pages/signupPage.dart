// ignore_for_file: non_constant_identifier_names

import 'package:educat/elements/constants/constants.dart';
import 'package:educat/elements/fonts/myText.dart';
import 'package:educat/screens/login-signup/elements/customButton.dart';
import 'package:educat/screens/login-signup/elements/textBox.dart';
import 'package:educat/screens/login-signup/services/authPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

final emailController = TextEditingController();
final passController = TextEditingController();
final confirmpassController = TextEditingController();

bool _obsecureText = true;
bool _cobsecureText = true;
bool _agreeTerms = false;

class _SignupPageState extends State<SignupPage> {
  void signUp() async {
    if (passController.text == confirmpassController.text) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text, password: passController.text);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return AuthPage();
        }));
      } on FirebaseException catch (e) {
        showError(e.code);
      }
    } else {
      showError('Password doesn\'t match');
    }
  }

  void showError(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Center(
              child: Text(
                message,
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: LayoutBuilder(builder: (context, Constraints) {
        return Container(
          margin: EdgeInsets.only(
              left: Constraints.maxWidth * 0.05,
              top: Constraints.maxHeight * 0.09,
              right: Constraints.maxWidth * 0.05,
              bottom: Constraints.maxHeight * 0.07),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                text: 'Create your \n account',
                fontSize: 34,
                fontWeight: FontWeight.w700,
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
              MyText(
                text: '  Confirm Password',
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
                        _cobsecureText = !_cobsecureText;
                      });
                    },
                    child: Icon(
                      _obsecureText ? Icons.visibility_off : Icons.visibility,
                      color: kGreycolor,
                    ),
                  ),
                  text: 'Your password',
                  obsecureText: _cobsecureText,
                  controller: confirmpassController),
              SizedBox(
                height: Constraints.maxHeight * 0.02,
              ),
              Row(
                children: [
                  Checkbox(
                      value: _agreeTerms,
                      onChanged: (newValue) {
                        setState(() {
                          _agreeTerms = newValue!;
                        });
                      })
                ],
              ),
              const Spacer(),
              CustomButton(
                  ontap: () {
                    _agreeTerms ? signUp() : null;
                  },
                  height: Constraints.maxHeight * 0.07,
                  color: _agreeTerms ? kGreencolor : kGreycolor,
                  child: MyText(
                    text: 'Sign up',
                    fontSize: 18,
                    color: Colors.white,
                  ))
            ],
          ),
        );
      }),
    );
  }
}
