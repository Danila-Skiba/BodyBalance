import 'package:flutter/material.dart';
import 'package:bloom_body_balance/pages/Recieps/recipe_card/lines/lines.dart';
import 'package:bloom_body_balance/screen_size.dart';

class RecipeCardPage extends StatelessWidget {
  final String recipeId;
  const RecipeCardPage({super.key, required this.recipeId});

  @override
  Widget build(BuildContext context) {
    final responsiveSize = ResponsiveSize(context);

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.only(bottom: responsiveSize.height(100)),
            child: const Column(children: [
              Line1(),
              Line2(),
              Line3(),
              Line4(),
              Line5(),
              Line6(),
              Line7(),
            ]),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.white,
              child: const Line8(),
            ),
          ),
        ],
      ),
    );
  }
}
