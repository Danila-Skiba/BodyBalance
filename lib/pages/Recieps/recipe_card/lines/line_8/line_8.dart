import 'package:flutter/material.dart';
import 'package:bloom_body_balance/design/colors.dart';
import 'package:bloom_body_balance/screen_size.dart';
import 'package:bloom_body_balance/pages/recipe_instructions/recipe_instructions_page.dart';

class Line8 extends StatelessWidget {
  const Line8({super.key});

  @override
  Widget build(BuildContext context) {
    final responsiveSize = ResponsiveSize(context);

    return Center(
      child: Padding(
        padding: EdgeInsets.only(
            bottom: responsiveSize.height(30), top: responsiveSize.height(10)),
        child: Container(
          width: responsiveSize.width(327),
          height: responsiveSize.height(57),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: darkGreenColor,
            border: Border.all(color: blackBorderColor, width: 1),
            boxShadow: const [
              BoxShadow(
                color: blackColor,
                offset: Offset(0, 1),
                blurRadius: 4,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Center(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RecipeInstructionsPage()),
                );
              },
              child: Text(
                'Готовить',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                    fontSize:
                        (responsiveSize.height(32) + responsiveSize.width(32)) /
                            2,
                    color: whiteColor),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
