import 'package:bloom_body_balance/appwait.dart';
import 'package:bloom_body_balance/auth_page.dart';

import 'package:bloom_body_balance/pages/navbarcomponents.dart';
import 'package:bloom_body_balance/pages/user_autorivisation/auth.dart';
import 'package:bloom_body_balance/pages/user_autorivisation/user_register/helper_info.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  Future<bool> checkUserExists(String userId) async {
    final userdoc = FirebaseFirestore.instance.collection('users').doc(userId);
    final snapshot = await userdoc.get();

    return snapshot.exists;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Auth().authChanges,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final user = Auth().currentuser;

            return FutureBuilder(
                key: ValueKey(snapshot.data),
                future: checkUserExists(user!.uid),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data as bool) {
                      return const AppMainScreenState();
                    } else {
                      return const HelperInfo();
                    }
                  } else {
                    return const ProgressMain();
                  }
                });
          } else {
            return  AuthPage();
          }
        });
  }
}
