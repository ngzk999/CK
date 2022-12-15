import 'package:ck/screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const CK());
}

class CK extends StatelessWidget {
  const CK({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        dividerTheme: const DividerThemeData(
          color: Color.fromRGBO(216,132,44,0.75),
          thickness: 0.75,
        ),
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: Colors.black54),
        ),
      ),
      home: const WelcomeScreen(),
    );
  }
}

