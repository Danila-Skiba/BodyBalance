import 'package:flutter/material.dart';
import 'package:bloom_body_balance/design/colors.dart';
import 'package:bloom_body_balance/screen_size.dart';

class Line6 extends StatelessWidget {
  const Line6({super.key});

  @override
  Widget build(BuildContext context) {
    final responsiveSize = ResponsiveSize(context);

    final List<String> diets = [
      'Вегетарианство',
      'ПП (Правильное Питание)',
      'Безглютеновая',
      'Средиземноморская',
    ];

    return Padding(
      padding: EdgeInsets.only(
        top: responsiveSize.height(12),
        left: responsiveSize.width(20),
        right: responsiveSize.width(28),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: lightGreenColor,
        ),
        child: ExpansionTile(
          shape: const Border(),
          title: Text(
            'Диета',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600,
              fontSize:
                  (responsiveSize.height(20) + responsiveSize.width(20)) / 2,
              color: blackColor,
            ),
          ),
          children: diets.map(
            (diet) {
              return ListTile(
                title: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: darkGreenColor,
                    border: Border.all(
                      color: blackBorderColor,
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: responsiveSize.width(12),
                    ),
                    child: Text(
                      diet,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                        fontSize: (responsiveSize.height(16) +
                                responsiveSize.width(16)) /
                            2,
                        color: whiteColor,
                      ),
                    ),
                  ),
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
