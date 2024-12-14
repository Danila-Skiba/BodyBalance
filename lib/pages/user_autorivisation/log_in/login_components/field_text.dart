import 'package:bloom_body_balance/design/colors.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FieldText extends StatefulWidget {
  final String texthint;
  final Icon icon;
  // ignore: prefer_typing_uninitialized_variables
  final controller;

  final TextInputType textInputType;
  final bool isemail;
  const FieldText(
      {super.key,
      required this.texthint,
      required this.icon,
      required this.controller,
      required this.textInputType,
      required this.isemail});

  @override
  State<FieldText> createState() => _FieldTextState();
}

class _FieldTextState extends State<FieldText> {
  bool isHiddenPassword = true;

  void togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }

  String? validateEmail(String? email) {
    if (email != null && !EmailValidator.validate(email)) {
      return 'Введите правильный Email';
    }

    return null;
  }

  String? validatePassword(String? password) {
    if (password != null && password.length < 6) {
      return 'Минимум 6 символов';
    }

    return null;
  }

  Widget? _passwordSuffix(bool isemail) {
    if (!isemail) {
      return InkWell(
        onTap: togglePasswordView,
        child: Icon(
          isHiddenPassword ? Icons.visibility_off : Icons.visibility,
          color: Colors.black,
          size: 20,
        ),
      );
    }
    return null;
  }

  final FocusNode _focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.textInputType,
      autocorrect: false,
      obscureText: widget.isemail ? !isHiddenPassword : isHiddenPassword,
      controller: widget.controller,
      validator: widget.isemail ? validateEmail : validatePassword,
      focusNode: _focusNode,
      decoration: InputDecoration(
        focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.all(Radius.circular(40))),
        errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.all(Radius.circular(40))),
        errorStyle: const TextStyle(height: 0),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.all(Radius.circular(40))),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor),
            borderRadius: BorderRadius.all(Radius.circular(40))),
        suffix: _passwordSuffix(widget.isemail),
        fillColor: primaryColorSwitch,
        filled: true,
        hintText: widget.texthint,
        prefixIcon: widget.icon,
        hintStyle: GoogleFonts.raleway(
          fontWeight: FontWeight.w400,
          fontSize: 16,
          color: const Color.fromRGBO(49, 87, 44, 0.8),
        ),
      ),
    );
  }
}
