import 'package:flutter/material.dart';

class ResponsiveSize {
  final BuildContext context;

  ResponsiveSize(this.context);

  double width(double value) {
    double percent = value / 375;
    final screenWidth = MediaQuery.of(context).size.width;
    return screenWidth * percent;
  }

  double height(double value) {
    double percent = value / 812;
    final screenHeight = MediaQuery.of(context).size.height;
    return screenHeight * percent;
  }
}
