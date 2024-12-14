import 'package:bloom_body_balance/design/colors.dart';
import 'package:bloom_body_balance/pages/home/snackbar.dart';

import 'package:bloom_body_balance/pages/user_autorivisation/components/appbars.dart';
import 'package:bloom_body_balance/pages/user_autorivisation/components/bottombars.dart';
import 'package:bloom_body_balance/pages/user_autorivisation/log_in/login_components/field_text.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginScreen({super.key, required this.showRegisterPage});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String errormessage = '';
  bool isHiddenPassword = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> signInWithEmailAndPassword() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      setState(() {
        errormessage = e.code;
      });

      if (errormessage == 'user-not-found' || e.code == 'wrong-password') {
        Snackbar.showSnackBar(
            // ignore: use_build_context_synchronously
            context,
            true,
            'Неправильный пароль или email. Повторите попытку');
        return;
      } else {
        Snackbar.showSnackBar(
            context, true, 'Неизвестная ошибка! Попробуйте ещё раз');
        return;
      }
    }
    dispose();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  void togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const AppBarsBuild(
        hieght: 120,
        image1: 'assets/images/Vectors/Vector 2.svg',
        image2: 'assets/images/Vectors/Vector 1.svg',
        leading: null,
      ),
      body: Column(children: [
        Container(
          padding: const EdgeInsets.only(top: 25),
          margin: const EdgeInsets.only(top: 10, left: 40),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Вход',
                      style: GoogleFonts.raleway(
                        fontWeight: FontWeight.w600,
                        fontSize: 60,
                        color: primaryColorText,
                      ))),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Пожалуйста войдите для продолжения',
                        style: GoogleFonts.raleway(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.black,
                            letterSpacing: -0.5))),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
          child: Form(
            key: formKey,
            child: Column(children: [
              FieldText(
                textInputType: TextInputType.emailAddress,
                isemail: true,
                texthint: 'Логин',
                icon: const Icon(Icons.people),
                controller: emailController,
              ),
              const SizedBox(height: 10),
              FieldText(
                textInputType: TextInputType.visiblePassword,
                isemail: false,
                texthint: 'Пароль',
                icon: const Icon(Icons.lock),
                controller: passwordController,
              ),
              Container(
                margin: const EdgeInsets.only(left: 70),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: Text(
                        'Нет аккаунта?',
                        style: GoogleFonts.raleway(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    TextButton(
                      style: ButtonStyle(
                        minimumSize:
                            WidgetStateProperty.all(const Size(20, 20)),
                      ),
                      onPressed: widget.showRegisterPage,
                      child: Text(
                        'Зарегистрироваться',
                        style: GoogleFonts.raleway(
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                            letterSpacing: 0.5,
                            color: primaryColorText),
                      ),
                    )
                  ],
                ),
              ),
              Center(
                child: TextButton(
                  style: ButtonStyle(
                      backgroundColor:
                          WidgetStateProperty.all(primaryColorText)),
                  onPressed: signInWithEmailAndPassword,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 112),
                    child: Text(
                      'Войти',
                      style: GoogleFonts.raleway(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              )
            ]),
          ),
        ),
      ]),
      bottomNavigationBar: const BottomBarsBuild(
          size: 0,
          hieght: 120,
          image1: 'assets/images/Vectors/Vector 4.svg',
          image2: 'assets/images/Vectors/Vector 3.svg'),
    );
  }
}
