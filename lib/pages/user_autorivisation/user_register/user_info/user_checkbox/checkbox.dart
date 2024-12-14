import 'package:bloom_body_balance/Userdataprovider.dart';
import 'package:bloom_body_balance/design/colors.dart';
import 'package:bloom_body_balance/pages/home/snackbar.dart';
import 'package:bloom_body_balance/pages/user_autorivisation/components/appbars.dart';
import 'package:bloom_body_balance/pages/user_autorivisation/user_register/user_info/components/buttonnext.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ActivityCheck extends StatefulWidget {
  const ActivityCheck({super.key});

  @override
  State<ActivityCheck> createState() => _ActivityCheckState();
}

class _ActivityCheckState extends State<ActivityCheck> {
  final activiyLevelController = TextEditingController();
  // Контроллеры для отслеживания выбранных ответов
  bool _isSedentary = false;
  bool _isLightlyActive = false;
  bool _isModeratelyActive = false;
  bool _isVeryActive = false;

  @override
  Widget build(BuildContext context) {
    final userDataProvider = Provider.of<UserDataProvider>(context);
    return Scaffold(
      appBar: AppBarsBuild(
        hieght: 76,
        image1: 'assets/images/Vectors/yellowvector1.svg',
        image2: 'assets/images/Vectors/greenvector1.svg',
        leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/usergender');
            },
            icon: const Icon(
              Icons.arrow_back_sharp,
              size: 30,
              color: Colors.grey,
            )),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 25, right: 25),
                child: RichText(
                    text: TextSpan(children: <TextSpan>[
                  TextSpan(
                    text: 'Какой ваш уровень ',
                    style: GoogleFonts.raleway(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  TextSpan(
                    text: '\nактивности?',
                    style: GoogleFonts.raleway(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: primaryColorText),
                  ),
                ])),
              ),
              Container(
                padding: const EdgeInsets.only(left: 5),
                child: const Image(
                  image: AssetImage('assets/images/assistent.png'),
                  width: 120,
                  height: 120,
                ),
              ),
            ],
          ),

          Container(
            margin: const EdgeInsets.only(left: 25),
            child: Column(
              children: [
                CheckPoint(
                  ischeck: _isSedentary,
                  onTap: () {
                    setState(() {
                      _isSedentary = !_isSedentary;
                      // Сброс остальных контроллеров
                      _isLightlyActive = false;
                      _isModeratelyActive = false;
                      _isVeryActive = false;
                    });
                  },
                  title: 'Сидячий образ жизни',
                  subtitle:
                      'Я редко занимаюсь спортом и провожу большую часть времени сидя',
                ),

                CheckPoint(
                  ischeck: _isLightlyActive,
                  onTap: () {
                    setState(() {
                      _isLightlyActive = !_isLightlyActive;
                      // Сброс остальных контроллеров
                      _isSedentary = false;
                      _isModeratelyActive = false;
                      _isVeryActive = false;
                    });
                  },
                  title: 'Лёкгая активность',
                  subtitle:
                      'Иногда я гуляю или делаю легие упражнения, чтобы оставаться активным',
                ),

                CheckPoint(
                  ischeck: _isModeratelyActive,
                  onTap: () {
                    setState(() {
                      _isModeratelyActive = !_isModeratelyActive;
                      // Сброс остальных контроллеров
                      _isSedentary = false;
                      _isLightlyActive = false;
                      _isVeryActive = false;
                    });
                  },
                  title: 'Умеренная активность',
                  subtitle:
                      'Я занимаюсь умеренными упражнениями несколько раз в неделю',
                ),

                CheckPoint(
                  ischeck: _isVeryActive,
                  onTap: () {
                    setState(() {
                      _isVeryActive = !_isVeryActive;
                      // Сброс остальных контроллеров
                      _isSedentary = false;
                      _isLightlyActive = false;
                      _isModeratelyActive = false;
                    });
                  },
                  title: 'Очень высокий',
                  subtitle:
                      'Я занимаюсь физической активностью несколько часов каждый день',
                ),
                // Checkbox для Лёгкая активность

                // Checkbox для Умеренная активность

                // Checkbox для Очень высокий
              ],
            ),
          ),
          // Checkbox для Сидячий образ

          const SizedBox(height: 16),
          // Кнопка "Сохранить" (можно добавить)
          ButtonNext(function: () {
            String level = '';
            if (_isLightlyActive) {
              level = 'Level';
            }
            if (_isSedentary) {
              level = 'Setendary';
            }

            if (_isModeratelyActive) {
              level = 'Modern';
            }
            if (_isVeryActive) {
              level = 'VeryActivity';
            } else if (!_isLightlyActive &&
                !_isSedentary &&
                !_isModeratelyActive &&
                !_isVeryActive) {
              Snackbar.showSnackBar(context, true, 'Укажите ваш уровень');
              return;
            }
            userDataProvider.updateUserData('activity', level.toString());
            Navigator.pushNamed(context, '/usernickname');
          })
        ],
      ),
    );
  }
}

class CheckPoint extends StatefulWidget {
  final VoidCallback onTap;
  final String title;
  final String subtitle;
  final bool ischeck;
  const CheckPoint(
      {super.key,
      required this.ischeck,
      required this.onTap,
      required this.title,
      required this.subtitle});

  @override
  State<CheckPoint> createState() => _CheckPointState();
}

class _CheckPointState extends State<CheckPoint> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 25),
      child: ListTile(
        title: Text(
          widget.title,
          style: GoogleFonts.raleway(
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        subtitle: Text(
          widget.subtitle,
          style: GoogleFonts.raleway(
            fontWeight: FontWeight.w400,
            fontSize: 15,
            color: Colors.black,
          ),
        ),
        leading: GestureDetector(
          onTap: widget.onTap,
          child: Container(
            width: 22,
            height: 22,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: primaryColorSwitch,
              border: Border.all(
                  color:
                      widget.ischeck ? primaryColorSwitch : Colors.transparent),
              // Граница
            ),
            child: widget.ischeck
                ? Center(
                    child: Container(
                      width: 9,
                      height: 9,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: primaryColorText, // Цвет внутреннего круга
                      ),
                    ),
                  )
                : null, // Внутренний кружок для активного состояния
          ),
        ),
        contentPadding: EdgeInsets.zero, // Удаление отступов
      ),
    );
  }
}
