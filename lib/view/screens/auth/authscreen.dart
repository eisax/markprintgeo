import 'package:flutter/material.dart';
import 'package:markprintgeo/view/screens/auth/widgets/signinscreen.dart';
import 'package:markprintgeo/view/screens/auth/widgets/signupscreen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return SignInScreen();
  }
}