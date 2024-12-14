import 'package:flutter/material.dart';
import 'package:bloom_body_balance/design/colors.dart';
import 'package:bloom_body_balance/screen_size.dart';

class Line4 extends StatelessWidget {
  const Line4({super.key});

  @override
  Widget build(BuildContext context) {
    final responsiveSize = ResponsiveSize(context);

    return Padding(
      padding: EdgeInsets.only(
        left: responsiveSize.width(20),
        right: responsiveSize.width(28),
        top: responsiveSize.height(12),
      ),
      child: Container(
        width: responsiveSize.width(327),
        height: responsiveSize.height(136),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: lightGreenColor,
        ),
        child: Padding(
          padding: EdgeInsets.only(left: responsiveSize.width(12)),
          child: Text(
            'Рататуй – традиционное блюдо   прованской кухни, представляет собой яркий ароматный овощной микс из кабачков, баклажанов, разноцветного сладкого перца и томатов.',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600,
              fontSize:
                  (responsiveSize.height(16) + responsiveSize.width(16)) / 2,
              color: blackColor,
            ),
          ),
        ),
      ),
    );
  }
}
