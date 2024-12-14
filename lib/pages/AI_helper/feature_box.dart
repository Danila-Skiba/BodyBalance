import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FeatureBox extends StatelessWidget {
  final Color color;
  final String headerText;
  final String description;
  const FeatureBox(
      {super.key,
      required this.color,
      required this.headerText,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10)
            .copyWith(left: 15),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    headerText,
                    style: GoogleFonts.raleway(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        letterSpacing: 1,
                        color: Colors.black),
                  )),
            ),
            Text(
              description,
              style: GoogleFonts.raleway(
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                  letterSpacing: 1,
                  color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
