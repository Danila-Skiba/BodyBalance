import 'package:bloom_body_balance/Userdataprovider.dart';
import 'package:bloom_body_balance/appwait.dart';
import 'package:bloom_body_balance/example.dart';
import 'package:bloom_body_balance/homepage.dart';
import 'package:bloom_body_balance/pages/navbarcomponents.dart';
import 'package:bloom_body_balance/pages/user_autorivisation/ex.dart';
import 'package:bloom_body_balance/pages/user_autorivisation/reset_password/reset_password.dart';
import 'package:bloom_body_balance/pages/user_autorivisation/user_register/helper_info.dart';
import 'package:bloom_body_balance/pages/user_autorivisation/user_register/helper_message.dart';
import 'package:bloom_body_balance/pages/user_autorivisation/user_register/user_info/user_allergens/allergens_info.dart';
import 'package:bloom_body_balance/pages/user_autorivisation/user_register/user_info/user_checkbox/checkbox.dart';
import 'package:bloom_body_balance/pages/user_autorivisation/user_register/user_info/user_databorn/user_data_born.dart';
import 'package:bloom_body_balance/pages/user_autorivisation/user_register/user_info/user_gender.dart/gender.dart';
import 'package:bloom_body_balance/pages/user_autorivisation/user_register/user_info/user_height.dart/user_scroll_height.dart';
import 'package:bloom_body_balance/pages/user_autorivisation/user_register/user_info/user_nickname/nickname_screen.dart';
import 'package:bloom_body_balance/pages/user_autorivisation/user_register/user_info/user_weight/user_weight.dart';
import 'package:bloom_body_balance/pages/user_autorivisation/verifyemail/verifyemail.dart';
import 'package:bloom_body_balance/widget_tree.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      StreamProvider<User?>.value(
        value: FirebaseAuth.instance.authStateChanges(),
        initialData: null,
      ),
      ChangeNotifierProvider(create: (_) => UserDataProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore.instance;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bloom Body Balance',
      theme: ThemeData.light(useMaterial3: true).copyWith(
        /*textTheme: TextTheme(
          bodySmall: GoogleFonts.raleway(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: primaryColorTextBlack),
          bodyMedium: GoogleFonts.raleway(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: primaryColorText),
          bodyLarge: GoogleFonts.raleway(
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: primaryColorTextBlack),
        ),*/
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder()
        }),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      routes: {
        //  '/home': (context) => const HomeScreen(),
        '/reset_password': (context) => const ResetPassword(),
        '/verify_email': (context) => const VerifyEmail(),
        '/account': (context) => const HomePage(),
        '/databornreg': (context) => const ScrollDataBorn(),
        '/infohelper': (context) => const HelperInfo(),
        '/dataweight': (context) => const ScrollDataWeight(),
        '/dataheight': (context) => const ScrollDataHeight(),
        '/usergender': (contex) => const GenderScreen(),
        '/activityuser': (context) => const ActivityCheck(),
        '/usernickname': (context) => const NickNameInfo(),
        '/helpermessage': (context) => const HelperMessage(),
        '/widgettree': (context) => const WidgetTree(),
        '/homepage': (context) => const HomePage(),
        '/appscreen': (context) => const AppMainScreenState(),
        '/eee': (context) => const Exempl(),
        '/er': (context) => const ProgressMain(),
        '/allergens': (context) => const AllergensPage(),
        '/example': (context) => ExampleWindow(),
        //'/recipecardpackage': (context) => RecipeCardPage(),
      },
      initialRoute: '/widgettree',
    );
  }
}
