import 'package:ck/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CK());
}

class CK extends StatelessWidget {
  const CK({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        dividerTheme: const DividerThemeData(
          color: Colors.grey
        ),
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: Colors.black54),
        ),
      ),
      home: const WelcomeScreen(),
    );
  }
}

