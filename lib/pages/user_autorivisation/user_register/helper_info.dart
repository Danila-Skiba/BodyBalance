import 'package:bloom_body_balance/design/colors.dart';
import 'package:bloom_body_balance/pages/user_autorivisation/components/appbars.dart';
import 'package:bloom_body_balance/pages/user_autorivisation/components/bottombars.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HelperInfo extends StatelessWidget {
  const HelperInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: const AppBarsBuild(
            hieght: 110,
            image1: 'assets/images/Vectors/yellowvector2.svg',
            image2: 'assets/images/Vectors/greenvector2.svg',
            leading: null,
          ),
          body: Column(
            children: [
              Container(
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 25),
                      width: 140,
                      height: 50,
                      child: Center(
                        child: Text('Привет!',
                            style: GoogleFonts.raleway(
                                fontSize: 35,
                                fontWeight: FontWeight.w500,
                                color: primaryColorText)),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 15),
                      child: const Image(
                        image: AssetImage('assets/images/assistent.png'),
                        width: 165,
                        height: 165,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 25, bottom: 16, right: 25),
                child: RichText(
                    text: TextSpan(children: <TextSpan>[
                  TextSpan(
                    text: 'Меня зовут ',
                    style: GoogleFonts.raleway(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                  TextSpan(
                    text: 'Якофф ',
                    style: GoogleFonts.raleway(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: primaryColorText),
                  ),
                  TextSpan(
                    text:
                        ' и я ваш персональный ассистент на базе искусственного интеллекта. Моя задача — помогать вам поддерживать активный образ жизни и следить за питанием, чтобы вы всегда оставались в отличной форме и хорошем здоровье. Чтобы мои рекомендации были максимально эффективными, расскажите мне немного о себе.',
                    style: GoogleFonts.raleway(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                ])),
              ),
              Center(
                child: TextButton(
                  style: ButtonStyle(
                      backgroundColor:
                          WidgetStateProperty.all(primaryColorText)),
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(context, '/databornreg',
                        (Route<dynamic> route) => false);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Text(
                      'Рассказать про себя',
                      style: GoogleFonts.raleway(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              )
            ],
          ),
          bottomNavigationBar: const BottomBarsBuild(
              size: -90,
              hieght: 120,
              image1: 'assets/images/Vectors/Vector 7.svg',
              image2: 'assets/images/Vectors/Vector 8.svg')),
    );
  }
}
