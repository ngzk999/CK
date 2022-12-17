import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sign_in_button/sign_in_button.dart';

import '../services/auth_service.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 45.0,
                  height: 100.0,
                ),
                SizedBox(
                  height: 100.0,
                  child: Image.asset('images/ck_logo.png'),
                ),
                Text(
                  'CK',
                  style: GoogleFonts.openSans(
                    textStyle: const TextStyle(
                      color: Color.fromRGBO(216, 132, 44, 1),
                      fontSize: 45.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 14.0),
                  child: DefaultTextStyle(
                    style: GoogleFonts.openSans(
                      textStyle: const TextStyle(
                        color: Color.fromRGBO(216, 132, 44, 1),
                        fontSize: 45.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        FadeAnimatedText(
                          'Mart',
                          duration: const Duration(milliseconds: 1350),
                        ),
                        FadeAnimatedText(
                          'Bidan',
                          duration: const Duration(milliseconds: 1350),
                        ),
                        FadeAnimatedText(
                          'Mama',
                          duration: const Duration(milliseconds: 1350),
                        ),
                      ],
                      repeatForever: true,
                      isRepeatingAnimation: true,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Material(
                elevation: 5.0,
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  onPressed: () {
                    // Go to login screen
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: const Text('Sign in'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Material(
                elevation: 5.0,
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  onPressed: () {
                    // Go to register screen
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: const Text('Register'),
                ),
              ),
            ),
            const Divider(
              height: 30.0,
              indent: 15.0,
              endIndent: 15.0,
            ),
            Column(
              children: [
                SignInButton(
                  Buttons.google,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  elevation: 5.0,
                  onPressed: () {
                    AuthService().signInWithGoogle();
                  },
                ),
                SignInButton(
                  Buttons.facebookNew,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  elevation: 5.0,
                  onPressed: () {
                    AuthService().signInWithFacebook();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
