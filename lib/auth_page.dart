import 'package:bloom_body_balance/pages/user_autorivisation/log_in/login.dart';
import 'package:bloom_body_balance/pages/user_autorivisation/user_register/register.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showLoginPage = true;
  void toggleScreens() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginScreen(
        showRegisterPage: toggleScreens,
      );
    } else {
      return Register(
        showLoginPage: toggleScreens,
      );
    }
  }
}
