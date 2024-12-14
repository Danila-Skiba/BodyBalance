import 'package:flutter/material.dart';

abstract class DataWidget extends StatelessWidget {
  final int data;

  const DataWidget({super.key, required this.data});

  Widget buildWidget(BuildContext context); // Абстрактный метод

  @override
  Widget build(BuildContext context) {
    return buildWidget(context);
  }
}
