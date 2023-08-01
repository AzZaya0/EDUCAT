import 'package:firebase_auth/firebase_auth.dart';

import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignin {
  Future signInWithGoogle() async {
    GoogleSignIn googlesignin = GoogleSignIn();
    try {
      final GoogleSignInAccount? guser = await googlesignin.signIn();
      if (guser == null) {
        return;
      }
      final GoogleSignInAuthentication gauth = await guser.authentication;

      final credential = GoogleAuthProvider.credential(
          accessToken: gauth.accessToken, idToken: gauth.idToken);

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      print(e);
    }

    // authentication
  }
}
