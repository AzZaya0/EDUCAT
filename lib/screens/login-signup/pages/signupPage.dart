// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously
import 'package:educat/elements/constants/constants.dart';
import 'package:educat/elements/fonts/myText.dart';
import 'package:educat/screens/login-signup/elements/customButton.dart';
import 'package:educat/screens/login-signup/elements/textBox.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../provider/signupProvider.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    final SignuppProvider = Provider.of<SignupProvider>(context, listen: false);
    return Scaffold(
      body: LayoutBuilder(builder: (context, Constraints) {
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
                text: 'Create your \naccount',
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
                  controller: SignuppProvider.emailControl),
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

              //////////////////////////////////////////////////////////////////
              Consumer<SignupProvider>(builder: ((context, value, child) {
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
                    controller: SignuppProvider.passControl);
              })),

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

              Consumer<SignupProvider>(builder: ((context, snapshot, child) {
                return TextBox(
                    suffixIcon: GestureDetector(
                      onTap: () {
                        snapshot.cObsecure;
                      },
                      child: Icon(
                        snapshot.obsecure
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: kGreycolor,
                      ),
                    ),
                    text: 'Your password',
                    obsecureText: snapshot.cObsecure,
                    controller: SignuppProvider.confirmPassControl);
              })),

              SizedBox(
                height: Constraints.maxHeight * 0.02,
              ),
              Row(
                children: [
                  Checkbox(
                      value: SignuppProvider.agree,
                      onChanged: (newValue) {
                        SignuppProvider.agree == newValue!;
                      })
                ],
              ),
              const Spacer(),
              Consumer<SignupProvider>(builder: ((context, value, child) {
                return CustomButton(
                    ontap: () {
                      value.agreeTerms();
                    },
                    height: Constraints.maxHeight * 0.07,
                    color: value.agree ? kMainColor : kGreycolor,
                    child: MyText(
                      text: 'Sign up',
                      fontSize: 18,
                      color: Colors.white,
                    ));
              }))
            ],
          ),
        );
      }),
    );
  }
}



// setState(() {
//                           _agreeTerms = newValue!;
//                         });