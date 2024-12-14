import 'package:bloom_body_balance/Userdataprovider.dart';
import 'package:bloom_body_balance/design/colors.dart';
import 'package:bloom_body_balance/pages/user_account/userProfile.dart';
import 'package:bloom_body_balance/pages/user_autorivisation/components/appbars.dart';
import 'package:bloom_body_balance/pages/user_autorivisation/components/bottombars.dart';
import 'package:bloom_body_balance/pages/user_autorivisation/user_register/user_info/components/buttonnext.dart';
import 'package:bloom_body_balance/pages/user_autorivisation/user_register/user_info/user_nickname/form_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NickNameInfo extends StatefulWidget {
  const NickNameInfo({super.key});

  @override
  State<NickNameInfo> createState() => _NickNameInfoState();
}

class _NickNameInfoState extends State<NickNameInfo> {
  Future<void> safeProfile() async {
    final user = Provider.of<UserProfileInit>(context, listen: false);
    user.firstName = namecontroller.text.trim();
    user.lastName = femalecontroller.text.trim();

    await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .set(user.toJson());

    dispose();
  }

  @override
  void dispose() {
    namecontroller.dispose();
    femalecontroller.dispose();
    super.dispose();
  }

  final formKey = GlobalKey<FormState>();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController femalecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final userDataProvider = Provider.of<UserDataProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBarsBuild(
        hieght: 85,
        image1: 'assets/images/Vectors/yellowvector1.svg',
        image2: 'assets/images/Vectors/greenvector1.svg',
        leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/activityuser');
            },
            icon: const Icon(
              Icons.arrow_back_sharp,
              size: 30,
              color: Colors.grey,
            )),
      ),
      body: Column(children: [
        Row(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 40, right: 25,top: 50),
              child: RichText(
                  text: TextSpan(children: <TextSpan>[
                TextSpan(
                  text: 'Как к вам ',
                  style: GoogleFonts.raleway(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                TextSpan(
                  text: '\nобращаться?',
                  style: GoogleFonts.raleway(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: primaryColorText),
                ),
              ])),
            ),
            Container(
              margin: const EdgeInsets.only(left: 25, top: 60),
              child: const Image(
                image: AssetImage('assets/images/assistent.png'),
                width: 120,
                height: 120,
              ),
            ),
          ],
        ),
        Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
            child: Form(
                key: formKey,
                child: Column(children: [
                  FormFieldNickname(
                    hinttext: 'Имя (обязательно)',
                    controller: namecontroller,
                  ),
                  const SizedBox(height: 20),
                  FormFieldNickname(
                    hinttext: 'Фамилия (обязательно)',
                    controller: femalecontroller,
                  ),
                ]))),
        const SizedBox(
          height: 30,
        ),
        ButtonNext(function: () {
          final isValid = formKey.currentState!.validate();
          if (!isValid) return;
          userDataProvider.updateUserData(
            'name',
            namecontroller.text,
          );
          userDataProvider.updateUserData('secondname', femalecontroller.text);
          Navigator.pushNamedAndRemoveUntil(
              context, '/allergens', (Route<dynamic> route) => false);
        })
      ]),
      bottomNavigationBar: const BottomBarsBuild(
          size: -15,
          hieght: 140,
          image1: 'assets/images/Vectors/Vector 4.svg',
          image2: 'assets/images/Vectors/Vector 3.svg'),
    );
  }
}
