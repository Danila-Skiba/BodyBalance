import 'package:flutter/material.dart';
import 'package:bloom_body_balance/design/colors.dart';
import 'package:bloom_body_balance/screen_size.dart';

class Line2 extends StatelessWidget {
  const Line2({super.key});

  @override
  Widget build(BuildContext context) {
    final responsiveSize = ResponsiveSize(context);

    Image clockImage = Image.asset(
      'assets/images/recieps/archive/clock.png',
      width: responsiveSize.width(24),
      height: responsiveSize.height(24),
      fit: BoxFit.cover,
    );

    return Padding(
      padding: EdgeInsets.only(
          left: responsiveSize.width(18), right: responsiveSize.width(30)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: responsiveSize.height(12)),
            child: Text(
              'Рататуй',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                fontSize:
                    (responsiveSize.height(32) + responsiveSize.width(32)) / 2,
                color: primaryColorTextBlack,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: responsiveSize.height(32)),
            child: Row(
              children: [
                Container(
                  width: responsiveSize.width(44),
                  height: responsiveSize.width(44) * (17 / 44),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                  child: Center(
                    child: Text(
                      'Ужин',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                          fontSize: (responsiveSize.height(12) +
                                  responsiveSize.width(12)) /
                              2,
                          color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: responsiveSize.height(26)),
                child: clockImage,
              ),
              SizedBox(
                width: responsiveSize.width(2),
              ),
              Padding(
                padding: EdgeInsets.only(top: responsiveSize.height(27)),
                child: Text(
                  '2+ часа',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      fontSize: (responsiveSize.height(16) +
                              responsiveSize.width(16)) /
                          2,
                      color: Colors.black),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
