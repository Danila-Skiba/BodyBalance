import 'package:bloom_body_balance/Userdataprovider.dart';
import 'package:bloom_body_balance/design/colors.dart';
import 'package:bloom_body_balance/pages/home/snackbar.dart';
import 'package:bloom_body_balance/pages/user_account/userProfile.dart';
import 'package:bloom_body_balance/pages/user_autorivisation/components/appbars.dart';
import 'package:bloom_body_balance/pages/user_autorivisation/components/bottombars.dart';
import 'package:bloom_body_balance/pages/user_autorivisation/user_register/user_info/components/buttonnext.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GenderScreen extends StatefulWidget {
  const GenderScreen({super.key});

  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  Future<void> saveProfile() async {
    final user = Provider.of<UserProfileInit>(context, listen: false);
    user.gender = _selectedGender.toString();
  }

  String? _selectedGender;
  @override
  Widget build(BuildContext context) {
    final userDataProvider = Provider.of<UserDataProvider>(context);
    return Scaffold(
      appBar: AppBarsBuild(
        hieght: 70,
        image2: 'assets/images/Vectors/registerbar1.svg',
        image1: 'assets/images/Vectors/registerbar2.svg',
        leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/dataheight');
            },
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.grey,
              size: 30,
            )),
      ),
      body: Column(children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 10),
              child: const Image(
                image: AssetImage('assets/images/assistent.png'),
                width: 150,
                height: 150,
              ),
            ),
            SizedBox(
              width: 200,
              height: 60,
              child: RichText(
                  text: TextSpan(children: <TextSpan>[
                TextSpan(
                  text: 'Укажи свой ',
                  style: GoogleFonts.raleway(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                TextSpan(
                  text: 'пол',
                  style: GoogleFonts.raleway(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: primaryColorText),
                ),
              ])),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GenderOption(
                gender: 'man',
                imagePath: 'assets/images/man2.png',
                isSelected: _selectedGender == 'man',
                onTap: () {
                  setState(() {
                    _selectedGender = 'man';
                  });
                }),
            GenderOption(
                gender: 'woman',
                imagePath: 'assets/images/woman2.png',
                isSelected: _selectedGender == 'woman',
                onTap: () {
                  setState(() {
                    _selectedGender = 'woman';
                  });
                }),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        ButtonNext(function: () {
          if (_selectedGender == null) {
            Snackbar.showSnackBar(context, true, 'Укажите ваш пол');
            return;
          }
          userDataProvider.updateUserData('gender', _selectedGender.toString());
          Navigator.pushNamed(context, '/activityuser');
        }),
      ]),
      bottomNavigationBar: const BottomBarsBuild(
          size: -90,
          hieght: 120,
          image1: 'assets/images/Vectors/Vector 7.svg',
          image2: 'assets/images/Vectors/Vector 8.svg'),
    );
  }
}

class GenderOption extends StatelessWidget {
  final String gender;
  final String imagePath;
  final bool isSelected;
  final VoidCallback onTap;
  const GenderOption(
      {super.key,
      required this.gender,
      required this.imagePath,
      required this.isSelected,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            border: Border.all(
                color: isSelected ? Colors.black : Colors.transparent,
                width: 2)),
        child: Image.asset(
          imagePath,
          width: 120,
          height: 200,
        ),
      ),
    );
  }
}
