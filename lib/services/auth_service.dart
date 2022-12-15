import 'package:ck/screens/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  signInTest() async {
    // Create a GoogleSignIn instance
    final GoogleSignIn googleSignIn = GoogleSignIn();

    // Sign in the user
    GoogleSignInAccount? account = await googleSignIn.signIn();
    print(account);
  }

  signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn(
      scopes: <String>["email"]).signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
      accessToken: googleAuth.accessToken
    );

    // Once signed in, return the UserCredential
    final x = await FirebaseAuth.instance.signInWithCredential(credential);
    print(x);
    return x;
  }

  signInWithFacebook() async {
    final facebookLoginResult = await FacebookAuth.instance.login();
    final userData = await FacebookAuth.instance.getUserData();

    final facebookAuthCredential = FacebookAuthProvider.credential(facebookLoginResult.accessToken!.token);
    await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);

    print(userData);
  }

  signOut() {
    FirebaseAuth.instance.signOut();
  }

  // handleAuthState() {
  //   return StreamBuilder(
  //       stream: FirebaseAuth.instance.authStateChanges(),
  //       builder: (BuildContext context, snapshot) {
  //         if (snapshot.hasData) {
  //           return const WelcomeScreen();
  //         } else {
  //           return const RegisterScreen();
  //         }
  //       });
  // }
}
