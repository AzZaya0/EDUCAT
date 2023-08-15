// ignore_for_file: use_build_context_synchronously

import 'package:educat/screens/login-signup/services/authPage.dart';
import 'package:educat/screens/onBoarding/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckOnboard extends StatefulWidget {
  CheckOnboard({super.key});

  @override
  State<CheckOnboard> createState() => _CheckOnboardState();

  void saveData(check) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool('checkData', check);
  }

  void readData(BuildContext context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool? value = pref.getBool('checkData');

    if (value != null) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return AuthPage();
      }));
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return Onboarding();
      }));
    }
  }
}

class _CheckOnboardState extends State<CheckOnboard> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CheckOnboard().readData(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
