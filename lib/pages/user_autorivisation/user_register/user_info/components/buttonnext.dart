import 'package:bloom_body_balance/design/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonNext extends StatelessWidget {
  final String? name;
  final VoidCallback function;
  const ButtonNext({super.key, required this.function, this.name});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(primaryColorText)),
        onPressed: function,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: Text(
            name == null ? 'Продолжить' : name.toString(),
            style: GoogleFonts.raleway(
                color: Colors.white, fontSize: 21, fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
