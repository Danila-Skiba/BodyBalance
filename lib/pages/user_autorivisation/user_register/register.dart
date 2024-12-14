import 'package:bloom_body_balance/design/colors.dart';
import 'package:bloom_body_balance/pages/user_autorivisation/auth.dart';

import 'package:bloom_body_balance/pages/user_autorivisation/components/appbars.dart';
import 'package:bloom_body_balance/pages/user_autorivisation/components/bottombars.dart';

import 'package:bloom_body_balance/pages/user_autorivisation/log_in/login_components/field_text.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class Register extends StatefulWidget {
  final VoidCallback showLoginPage;
  const Register({
    super.key,
    required this.showLoginPage,
  });

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String errormessage = '';
  final formKey = GlobalKey<FormState>();
  bool isHiddenPassword = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordController2 = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    passwordController2.dispose();

    super.dispose();
  }

  void togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }

  Future<void> createInWithEmailAndPassword() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    if (passwordController.text != passwordController2.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Пароли должны совпадать'),
        ),
      );
      return;
    }
    try {
      await Auth().createInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      setState(() {
        errormessage = e.code;
      });

      if (errormessage == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Такой Email уже используется'),
          ),
        );
        return;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Неизвестная ошибка! Попробуйте ещё раз'),
          ),
        );
        return;
      }
    }
    dispose();
  }

  /*Future<void> register() async {
    final navigator = Navigator.of(context);
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    if (passwordController.text != passwordController2.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Пароли должны совпадать'),
        ),
      );
      return;
    }

    try {
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.trim());

      String uid = user.user!.uid; //получаем id пользователя

      final userProfile = Provider.of<UserProfileInit>(context, listen: false);

      userProfile.uid = uid;

      // Перенаправление после успешной регистрации
      navigator.pushNamedAndRemoveUntil(
          '/databornreg', (Route<dynamic> route) => false);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Такой Email уже используется'),
          ),
        );
        return;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Неизвестная ошибка! Попробуйте ещё раз'),
          ),
        );
        return;
      }
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const AppBarsBuild(
        hieght: 100,
        image2: 'assets/images/Vectors/registerbar1.svg',
        image1: 'assets/images/Vectors/registerbar2.svg',
        leading: null,
      ),
      body: Column(children: [
        Container(
          padding: const EdgeInsets.only(top: 0),
          margin: const EdgeInsets.only(top: 0, left: 40),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Регистрация',
                      style: GoogleFonts.raleway(
                        fontWeight: FontWeight.w600,
                        fontSize: 50,
                        color: primaryColorText,
                      ))),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Пожалуйста, зарегистрируйтесь для входа',
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
                isemail: true,
                textInputType: TextInputType.emailAddress,
                texthint: 'Логин',
                icon: const Icon(Icons.people),
                controller: emailController,
              ),
              const SizedBox(height: 10),
              FieldText(
                isemail: false,
                textInputType: TextInputType.visiblePassword,
                texthint: 'Пароль',
                icon: const Icon(Icons.lock),
                controller: passwordController,
              ),
              const SizedBox(height: 10),
              FieldText(
                isemail: false,
                textInputType: TextInputType.visiblePassword,
                texthint: 'Повторите пароль',
                icon: const Icon(Icons.lock),
                controller: passwordController2,
              ),
              Container(
                margin: const EdgeInsets.only(left: 70),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: Text(
                        'Уже есть аккаунт?',
                        style: GoogleFonts.raleway(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    TextButton(
                      style: ButtonStyle(
                        minimumSize:
                            WidgetStateProperty.all(const Size(20, 20)),
                      ),
                      onPressed: widget.showLoginPage,
                      child: Text(
                        'Войти',
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
                  onPressed: createInWithEmailAndPassword,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      'Зарегистрироваться',
                      style: GoogleFonts.raleway(
                          color: Colors.white,
                          fontSize: 21,
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
