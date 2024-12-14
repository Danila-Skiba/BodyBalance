import 'package:flutter/material.dart';
import 'package:bloom_body_balance/design/colors.dart';
import 'package:bloom_body_balance/screen_size.dart';
import 'ingredients_dialog.dart';

class Line3 extends StatefulWidget {
  const Line3({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Line3State createState() {
    return _Line3State();
  }
}

class _Line3State extends State<Line3> {
  bool isFavorite = false;

  void _toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });

    final snackBar = SnackBar(
      content: Text(
        isFavorite
            ? 'Рецепт добавлен в избранное'
            : 'Рецепт удален из избранного',
        style: const TextStyle(color: Colors.black),
      ),
      backgroundColor: Colors.black,
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    final responsiveSize = ResponsiveSize(context);

    return Padding(
      padding: EdgeInsets.only(
        left: responsiveSize.width(20),
        right: responsiveSize.width(31),
        top: responsiveSize.height(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              ingredientsDialog(
                context,
              );
            },
            child: Container(
              width: responsiveSize.width(191),
              height: responsiveSize.height(25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: primaryColorText,
                border: Border.all(
                  color: Colors.black12,
                  width: 1,
                ),
              ),
              child: Center(
                child: Text(
                  'Список ингредиентов',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                    fontSize:
                        (responsiveSize.height(14) + responsiveSize.width(14)) /
                            2,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: responsiveSize.width(121),
            height: responsiveSize.height(25),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              border: Border.all(color: blackBorderColor, width: 1),
            ),
            child: Center(
              child: GestureDetector(
                onTap: _toggleFavorite,
                child: Text(
                  isFavorite ? 'В избранном' : 'В избранное',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                    fontSize:
                        (responsiveSize.height(14) + responsiveSize.width(14)) /
                            2,
                    color: isFavorite ? Colors.amber : blackColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
