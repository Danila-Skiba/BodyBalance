import 'package:flutter/material.dart';
import 'package:bloom_body_balance/design/colors.dart';
import 'package:bloom_body_balance/screen_size.dart';

void ingredientsDialog(BuildContext context) {
  final responsiveSize = ResponsiveSize(context);
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: primaryColorSwitch,
        title: const Text(
          'Ингредиенты',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              _buildIngredientItem('1. Помидоры', '50 гр.'),
              _buildIngredientItem('2. Кабачки', '50 гр.'),
              _buildIngredientItem('3. Баклажаны', '50 гр.'),
              _buildIngredientItem('4. Чеснок', '0.3 зубч.'),
              _buildIngredientItem('5. Растительное масло', '0.8 стол. л.'),
              _buildIngredientItem('6. Смесь трав', '0.5 гр.'),
              _buildIngredientItem('7. Перец чёрный молотый', 'по вкусу'),
              _buildIngredientItem('8. Соль', 'по вкусу'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: blackColor, width: 1),
                    color: whiteColor),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: responsiveSize.width(12),
                      right: responsiveSize.width(12)),
                  child: const Text(
                    'Закрыть',
                    style: TextStyle(
                      color: darkGreenColor,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Widget _buildIngredientItem(String ingredient, String quantity) {
  return Container(
    margin: const EdgeInsets.only(bottom: 8.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: blackBorderColor, width: 1),
      color: primaryColor,
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              ingredient,
              style: const TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: whiteColor,
              ),
              overflow: TextOverflow.visible,
            ),
          ),
          Flexible(
            child: Text(
              quantity,
              style: const TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: whiteColor,
              ),
              overflow: TextOverflow.visible,
            ),
          ),
        ],
      ),
    ),
  );
}
