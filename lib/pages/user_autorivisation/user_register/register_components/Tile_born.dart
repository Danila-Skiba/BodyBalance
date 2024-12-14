import 'package:bloom_body_balance/design/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class dDataBurn extends StatelessWidget {
  final int data;
  const dDataBurn({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          (data + 1970).toString(),
          style: GoogleFonts.raleway(
              fontSize: 25,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
              color: primaryColorText),
        ),
      ),
    );
  }
}
