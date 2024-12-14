import 'package:bloom_body_balance/design/colors.dart';
import 'package:bloom_body_balance/pages/user_autorivisation/user_register/user_info/components/abstract_info.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Data extends DataWidget {
  // ignore: use_super_parameters
  const Data({Key? key, required int data}) : super(key: key, data: data);

  @override
  Widget buildWidget(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          (data).toString(),
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
