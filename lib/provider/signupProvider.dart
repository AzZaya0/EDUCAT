import 'dart:js';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/login-signup/services/authPage.dart';

class SignupProvider with ChangeNotifier {
  //email and password controllers
  final emailController = TextEditingController();

  TextEditingController get emailControl => emailController;
  final passController = TextEditingController();
  TextEditingController get passControl => passController;
  final confirmpassController = TextEditingController();
  TextEditingController get confirmPassControl => confirmpassController;

  // obsecure text declaration

  bool _obsecureText = true;
  bool get obsecure => _obsecureText;
  bool _cobsecureText = true;
  bool get cObsecure => _cobsecureText;
  bool _agreeTerms = false;
  bool get agree => _agreeTerms;

  // password visible or not controller

  void eyeButton() {
    _obsecureText = !_obsecureText;
    notifyListeners();
  }

  void cEyeButton() {
    _cobsecureText = !_cobsecureText;
    notifyListeners();
  }

  void agreeTerms(){

     _agreeTerms ? signUp(context) : null;
  }

  // sign up function
  void signUp(context) async {
    if (passController.text == confirmpassController.text) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text, password: passController.text);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return AuthPage();
        }));
      } on FirebaseException catch (e) {
        showError(e.code, context);
      }
    } else {
      showError('Password doesn\'t match', context);
    }
  }

  void showError(String message, context) {
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
}
