import 'package:bloom_body_balance/design/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FormFieldNickname extends StatefulWidget {
  final String hinttext;
  final controller;
  const FormFieldNickname({
    super.key,
    required this.hinttext,
    this.controller,
  });

  @override
  State<FormFieldNickname> createState() => _FormFieldNicknameState();
}

class _FormFieldNicknameState extends State<FormFieldNickname> {
  String? validate(String? name) {
    if (name != null && name.length < 2) {
      return 'Введите корректно';
    }

    return null;
  }

  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: false,
      controller: widget.controller,
      validator: validate,
      focusNode: _focusNode,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(6).copyWith(left: 20),
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
        fillColor: primaryColorSwitch,
        filled: true,
        hintText: widget.hinttext,
        hintStyle: GoogleFonts.raleway(
          fontWeight: FontWeight.w400,
          fontSize: 20,
          color: const Color.fromRGBO(49, 87, 44, 0.8),
        ),
      ),
    );
  }
}
