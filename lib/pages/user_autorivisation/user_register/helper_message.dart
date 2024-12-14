import 'package:bloom_body_balance/Userdataprovider.dart';
import 'package:bloom_body_balance/design/colors.dart';
import 'package:bloom_body_balance/pages/user_autorivisation/components/appbars.dart';
import 'package:bloom_body_balance/pages/user_autorivisation/components/bottombars.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HelperMessage extends StatefulWidget {
  const HelperMessage({super.key});

  @override
  State<HelperMessage> createState() => _HelperMessageState();
}

class _HelperMessageState extends State<HelperMessage> {
  @override
  Widget build(BuildContext context) {
    final userDataProvider = Provider.of<UserDataProvider>(context);
    return Scaffold(
        appBar: AppBarsBuild(
          hieght: 85,
          image1: 'assets/images/Vectors/yellowvector3.svg',
          image2: 'assets/images/Vectors/greenvector3.svg',
          leading: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/usernickname');
              },
              icon: const Icon(
                Icons.arrow_back_sharp,
                size: 30,
                color: Colors.black,
              )),
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
                      child: Text('Готово!',
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
              margin: const EdgeInsets.only(left: 25, bottom: 16, right: 15),
              child: Text(
                'Но на этом наше знакомство еще не закончено. В приложении вы найдете множество полезных сервисов, включая разделы по правильному питанию, видеохостинг для обучающих и мотивационных видео, социальную сеть для общения с единомышленниками и центр знаний, где собрана вся необходимая информация для поддержания здоровья и активности. Погрузитесь в мир здорового образа жизни вместе со мной!',
                style: GoogleFonts.raleway(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              ),
            ),
            Center(
              child: TextButton(
                style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(primaryColorText)),
                onPressed: () {
                  userDataProvider
                      .saveUserData(userDataProvider.userData ?? {});
                  Navigator.pushNamed(context, '/appscreen');
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Text(
                    'Изучить приложение',
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
            size: -100,
            hieght: 80,
            image1: 'assets/images/Vectors/Vector 8.svg',
            image2: 'assets/images/Vectors/Vector 8.svg'));
  }
}
