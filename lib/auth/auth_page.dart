import 'package:flutter/material.dart';
import 'package:flutterxfirebase/pages/login_page.dart';
import 'package:flutterxfirebase/pages/signup_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showLoginPage = true;

  void toggleScreen() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return Login(showRegisterPage: toggleScreen);
    } else {
      return SignUp(showLoginPage: toggleScreen);
    }
  }
}
