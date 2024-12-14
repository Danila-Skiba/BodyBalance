// ignore: file_names
import 'package:flutter/material.dart';

class UserProfileInit extends ChangeNotifier {
  String uid = '';
  int yearOfBirth = 0;
  String gender = '';
  int weight = 0;
  int height = 0;
  String activityLevel = '';
  String firstName = '';
  String lastName = '';
  List<String> allergens = [];

  UserProfileInit(
      {required this.uid,
      required this.yearOfBirth,
      required this.gender,
      required this.weight,
      required this.height,
      required this.activityLevel,
      required this.firstName,
      required this.lastName,
     this.allergens = const [],});

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'yearOfBirth': yearOfBirth,
      'gender': gender,
      'weight': weight,
      'height': height,
      'activityLevel': activityLevel,
      'firstName': firstName,
      'lastName': lastName,
      'allergens': allergens,
    };
  }
}
