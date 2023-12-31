import 'package:educat/elements/fonts/myText.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../elements/constants/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(builder: (context, Constraints) {
      return SafeArea(
        child: Column(
          children: [
            // Profile and name displaying section 
            Container(
              height: Constraints.maxHeight * 0.2,
              width: Constraints.maxWidth,
              color: kMainColor,
              child: Padding(
                padding: EdgeInsets.only(
                    left: Constraints.maxWidth * 0.03,
                    right: Constraints.maxWidth * 0.03),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText(
                      text: 'Welcome back, ${user.displayName!}',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: kTextBoxColor,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      clipBehavior: Clip.antiAlias,
                      child: Image.network(
                        user.photoURL!,
                        height: Constraints.maxHeight * 0.076,
                      ), //commit haha
                    ),
                  ],
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(left: 30, right: 30),
              height: Constraints.maxHeight * 0.05,
              color: Colors.blue,
            ),

            //search bar section

            //main section

            //additional course sections
            Container(
              child: Column(
                children: [],
              ),
            ),
            MyText(text: 'Explore more course', fontSize: 20),

            InkWell(
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  GoogleSignIn().signOut();
                },
                child: Center(
                  child: Container(
                    height: 40,
                    width: 100,
                    color: Colors.red,
                    child: Text('Signout'),
                  ),
                )),
          ],
        ),
      );
    })

        //

        );
  }
}
