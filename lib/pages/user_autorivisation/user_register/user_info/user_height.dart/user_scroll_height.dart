import 'package:bloom_body_balance/Userdataprovider.dart';
import 'package:bloom_body_balance/design/colors.dart';
import 'package:bloom_body_balance/pages/user_account/userProfile.dart';
import 'package:bloom_body_balance/pages/user_autorivisation/components/appbars.dart';
import 'package:bloom_body_balance/pages/user_autorivisation/components/bottombars.dart';
import 'package:bloom_body_balance/pages/user_autorivisation/user_register/user_info/components/buttonnext.dart';
import 'package:bloom_body_balance/pages/user_autorivisation/user_register/user_info/components/components.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ScrollDataHeight extends StatefulWidget {
  const ScrollDataHeight({super.key});

  @override
  State<ScrollDataHeight> createState() => _ScrollDataHeightState();
}

class _ScrollDataHeightState extends State<ScrollDataHeight> {
  Future<void> _saveProfile() async {
    final user = Provider.of<UserProfileInit>(context, listen: false);
    user.height = controller.selectedItem + startitem;
    dispose();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  FixedExtentScrollController controller = FixedExtentScrollController();
  int startitem = 120;
  @override
  Widget build(BuildContext context) {
    final userDataProvider = Provider.of<UserDataProvider>(context);
    return SafeArea(
        child: Scaffold(
            appBar: AppBarsBuild(
              hieght: 110,
              image1: 'assets/images/Vectors/yellowvector1.svg',
              image2: 'assets/images/Vectors/greenvector1.svg',
              leading: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/dataweight');
                  },
                  icon: const Icon(
                    Icons.arrow_back_sharp,
                    size: 30,
                    color: Colors.grey,
                  )),
            ),
            body: Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 10),
                      child: const Image(
                        image: AssetImage('assets/images/assistent2.png'),
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
                          text: 'рост',
                          style: GoogleFonts.raleway(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                              color: primaryColorText),
                        ),
                      ])),
                    )
                  ],
                ),
                ScrollWheelInfo(
                  FixedExtentScrollController: controller,
                  startitem: startitem,
                  count: 100,
                  info: 'См.',
                ),
                ButtonNext(function: () {
                  userDataProvider.updateUserData(
                      'height', controller.selectedItem + startitem);
                  Navigator.pushNamed(context, '/usergender');
                })
              ],
            ),
            bottomNavigationBar: const BottomBarsBuild(
                size: -90,
                hieght: 160,
                image1: 'assets/images/Vectors/Vector 7.svg',
                image2: 'assets/images/Vectors/Vector 8.svg')));
  }
}
