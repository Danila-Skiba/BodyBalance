import 'package:bloom_body_balance/pages/user_autorivisation/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserDataProvider extends ChangeNotifier {


final auth = Auth();

  final db = FirebaseFirestore.instance;
   User? user;

  Map<String, dynamic> userData = {};

  bool isLoading = false; 


  Future<void> getUserData() async {
isLoading = true;
notifyListeners();

user= auth.currentuser;

if(user!=null){
    String uid = user!.uid;

    DocumentSnapshot snapshot = await db.collection('users').doc(uid).get();
    if (snapshot.exists) {
      userData = snapshot.data() as Map<String, dynamic>;
    }
  }
  isLoading = false;
  notifyListeners();
  }

  UserDataProvider()
  {
    getUserData();
  }
  Future<void> saveUserData(Map<String, dynamic> data) async {
    if (user != null) {
      String uid = user!.uid;
      await db.collection('users').doc(uid).set(data);
      await getUserData(); // Обновляем данные после сохранения
    }
  }

  void updateUserData(String key, dynamic value) {
    userData[key] = value;
    notifyListeners();
  }
}
