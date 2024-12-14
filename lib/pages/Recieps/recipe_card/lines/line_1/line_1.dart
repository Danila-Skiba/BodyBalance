import 'package:bloom_body_balance/pages/navbarcomponents.dart';
import 'package:flutter/material.dart';
import 'package:bloom_body_balance/screen_size.dart';

class Line1 extends StatelessWidget {
  const Line1({super.key});

  @override
  Widget build(BuildContext context) {
    final responsiveSize = ResponsiveSize(context);

    Image dishImage = Image.asset(
      'assets/images/recieps/archive/dish.png',
      fit: BoxFit.cover,
    );

    Image backImage = Image.asset(
      'assets/images/recieps/archive/back.png',
      width: responsiveSize.width(20),
      height: responsiveSize.height(18),
    );

    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          child: dishImage,
        ),
        Positioned(
          top: responsiveSize.height(76),
          left: responsiveSize.width(25),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AppMainScreenState()),
              );
            },
            child: backImage,
          ),
        ),
      ],
    );
  }
}
