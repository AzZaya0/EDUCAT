import 'package:educat/screens/login-signup/services/googleSignin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
      return Column(
        children: [
          Row(
            children: [
              Center(
                child: ClipRRect(
                  child: Image.network(user.photoURL!), //commit haha
                ),
              ),
            ],
          )
        ],
      );
    })

        //
        // InkWell(
        //     onTap: () {
        //       FirebaseAuth.instance.signOut();
        //       GoogleSignIn().signOut();
        //     },
        //     child: Center(
        //       child: Container(
        //         height: 40,
        //         width: 100,
        //         color: Colors.red,
        //         child: Text('Signout'),
        //       ),
        //     )),
        );
  }
}
