import 'package:bloom_body_balance/design/colors.dart';
import 'package:bloom_body_balance/pages/AI_helper/feature_box.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String lastWords = '';
  final speechToText = SpeechToText();
  @override
  void initState() {
    initSpeachToText();
    super.initState();
  }

  Future<void> initSpeachToText() async {
    await speechToText.initialize();
    setState(() {});
  }

  Future<void> startListening() async {
    await speechToText.listen(onResult: onSpeechResult);
    setState(() {});
  }

  Future<void> stopListening() async {
    await speechToText.stop();
    setState(() {});
  }

  void onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      lastWords = result.recognizedWords;
      if (kDebugMode) {
        print(lastWords);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    speechToText.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 40,
            backgroundColor: Colors.transparent,
            elevation: 0,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
                background: Container(
              color: Colors.transparent,
              child: Stack(
                children: [
                  SvgPicture.asset(
                    'assets/images/Vectors/Vector 16.svg',
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                      top: -10,
                      child: SvgPicture.asset(
                        'assets/images/Vectors/Vector 13.svg',
                        fit: BoxFit.cover,
                      )),
                  Positioned(
                      top: 10,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: IconButton(
                          icon: const Icon(Icons.menu),
                          onPressed: () {},
                        ),
                      ))
                ],
              ),
            )),
          ),
          SliverToBoxAdapter(
              child:
                  //вирутальный ассистент Яша
                  Stack(children: [
            Center(
              child: Container(
                height: 120,
                width: 120,
                margin: const EdgeInsets.only(top: 15),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    color: primaryColor,
                    shape: BoxShape.circle),
              ),
            ),
            Container(
                height: 130,
                margin: const EdgeInsets.only(top: 15),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/images/assistent.png'))))
          ])),
          SliverToBoxAdapter(
            //чат
            child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                margin: const EdgeInsets.symmetric(horizontal: 40).copyWith(
                  top: 10,
                ),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black26),
                    color: primaryColorSwitch,
                    borderRadius: BorderRadius.circular(20)
                        .copyWith(topLeft: Radius.zero)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  child: RichText(
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                        text: 'Привет, я ваш персональный ассистент ',
                        style: GoogleFonts.raleway(
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                            letterSpacing: 1.5,
                            color: Colors.black),
                      ),
                      TextSpan(
                        text: 'Якофф',
                        style: GoogleFonts.raleway(
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                            letterSpacing: 2,
                            color: primaryColorText),
                      ),
                      TextSpan(
                          text: '! Чем могу помочь?',
                          style: GoogleFonts.raleway(
                              fontWeight: FontWeight.w400,
                              fontSize: 17,
                              letterSpacing: 2,
                              color: Colors.black))
                    ]),
                  ),
                )),
          ),
          SliverToBoxAdapter(
              child: Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(top: 10, left: 22),
                  alignment: Alignment.centerLeft,
                  child: Text('Часто задаваемые вопросы:',
                      style: GoogleFonts.raleway(
                          fontWeight: FontWeight.w800,
                          fontSize: 16,
                          letterSpacing: 1,
                          color: primaryColorText)))),
          const SliverToBoxAdapter(
              child: FeatureBox(
            color: accentprimaryColor,
            headerText: 'Составь программу тренировок',
            description:
                'Я смогу предложить персональную программу тренировок именно для вас!',
          )),
          const SliverToBoxAdapter(
              child: FeatureBox(
            color: Color.fromARGB(177, 158, 223, 243),
            headerText: 'Дай советы по моему питанию',
            description:
                'Я подберу множество интересных блюд, опираясь на ваши предпочтения!',
          )),
          const SliverToBoxAdapter(
              child: FeatureBox(
            color: Color.fromARGB(176, 255, 154, 252),
            headerText: 'Составь рацион на неделю',
            description: 'Я составлю сбалансированный рацион питания для вас!',
          )),
          const SliverToBoxAdapter(
              child: FeatureBox(
            color: Color.fromARGB(176, 255, 154, 252),
            headerText: 'Дай советы по моему питанию',
            description:
                'Я подберу множество интересных блюд, опираясь на ваши предпочтения!',
          )),
          const SliverToBoxAdapter(
              child: FeatureBox(
            color: Color.fromARGB(176, 255, 154, 252),
            headerText: 'Дай советы по моему питанию',
            description:
                'Я подберу множество интересных блюд, опираясь на ваши предпочтения!',
          )),
        ],
      ),
      // bottomNavigationBar: AppMainScreenState(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (await speechToText.hasPermission && speechToText.isNotListening) {
            await startListening();
          } else if (speechToText.isListening) {
            await stopListening();
          } else {
            initSpeachToText();
          }
        },
        backgroundColor: primaryColorSwitch,
        elevation: 0,
        child: const Icon(Icons.mic),
      ),
    );
  }
}
