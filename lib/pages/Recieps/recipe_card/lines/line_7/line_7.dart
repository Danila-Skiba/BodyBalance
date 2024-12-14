import 'package:flutter/material.dart';
import 'package:bloom_body_balance/design/colors.dart';
import 'package:bloom_body_balance/screen_size.dart';

class Line7 extends StatelessWidget {
  const Line7({super.key});

  @override
  Widget build(BuildContext context) {
    final responsiveSize = ResponsiveSize(context);

    const proteinGrams = 1;
    const fatGrams = 8;
    const carbGrams = 5;

    const totalGrams = proteinGrams + fatGrams + carbGrams;
    const proteinPercentage = (proteinGrams / totalGrams) * 100;
    const fatPercentage = (fatGrams / totalGrams) * 100;
    const carbPercentage = (carbGrams / totalGrams) * 100;

    const proteinCalories = proteinGrams * 4; // 4 ккал на грамм белка
    const fatCalories = fatGrams * 9; // 9 ккал на грамм жира
    const carbCalories = carbGrams * 4; // 4 ккал на грамм углеводов
    const totalCalories = proteinCalories + fatCalories + carbCalories;

    return Padding(
      padding: EdgeInsets.only(
        left: responsiveSize.width(20),
        right: responsiveSize.width(28),
        top: responsiveSize.height(12),
      ),
      child: Container(
        width: responsiveSize.width(327),
        height: responsiveSize.height(177),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: lightGreenColor,
        ),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: responsiveSize.width(15),
                right: responsiveSize.width(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: _buildBar('Белки', proteinPercentage, proteinGrams,
                        const Color.fromARGB(255, 113, 183, 241), context),
                  ),
                  SizedBox(
                    width: responsiveSize.width(20),
                  ),
                  Expanded(
                    child: _buildBar('Жиры', fatPercentage, fatGrams,
                        const Color.fromARGB(255, 255, 115, 105), context),
                  ),
                  SizedBox(
                    width: responsiveSize.width(20),
                  ),
                  Expanded(
                    child: _buildBar('Углеводы', carbPercentage, carbGrams,
                        const Color.fromARGB(255, 95, 173, 97), context),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 12,
              top: 8,
              child: Text(
                'На 100 г:',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                  fontSize:
                      (responsiveSize.height(20) + responsiveSize.width(20)) /
                          2,
                  color: blackColor,
                ),
              ),
            ),
            Positioned(
              right: 12,
              top: 8,
              child: _buildCaloriesCircle(totalCalories, responsiveSize),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCaloriesCircle(int calories, ResponsiveSize responsiveSize) {
    return Container(
      width: responsiveSize.width(40),
      height: responsiveSize.width(40),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: accentprimaryColor,
      ),
      child: Center(
        child: Text(
          '$calories ккал',
          style: const TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,
            color: primaryColorText,
            fontSize: 12,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildBar(String label, double percentage, int grams, Color color,
      BuildContext context) {
    final String roundedPercentage = percentage.toStringAsFixed(2);

    const maxHeight = 85;

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,
            color: blackColor,
          ),
        ),
        Text(
          '$roundedPercentage%',
          style: const TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,
            color: blackColor,
          ),
        ),
        Text(
          '$grams г',
          style: const TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 4),
        Container(
          height: (percentage / 100) * maxHeight,
          color: color,
        ),
      ],
    );
  }
}
