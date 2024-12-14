import 'package:bloom_body_balance/design/colors.dart';
import 'package:bloom_body_balance/homepage.dart';
import 'package:bloom_body_balance/pages/Recieps/screenhomerecieps.dart';
import 'package:bloom_body_balance/pages/user_account/account.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class AppMainScreenState extends StatefulWidget {
  const AppMainScreenState({super.key});

  @override
  State<AppMainScreenState> createState() => _AppMainScreenStateState();
}

class _AppMainScreenStateState extends State<AppMainScreenState> {
  int selected = 0;
  late final List<Widget> page;

  @override
  void initState() {
    page = [
      const UserProfile(),
      const HomePage(),
      navBarPage(Icons.heart_broken),
      Screenhomerecieps(),
      navBarPage(Icons.heart_broken),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: primaryColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
          child: GNav(
              selectedIndex: selected,
              backgroundColor: primaryColor,
              activeColor: const Color.fromARGB(255, 78, 145, 70),
              color: const Color.fromARGB(255, 39, 74, 34),
              tabBackgroundColor: accentprimaryColor,
              gap: 8,
              onTabChange: (value) {
                setState(() {
                  selected = value;
                });
              },
              padding: const EdgeInsets.all(5),
              tabs: const [
                GButton(
                  icon: IconData(
                    99,
                    fontFamily: 'Icons',
                  ),
                  text: 'Главная',
                  iconSize: 40,
                ),
                GButton(
                  icon: IconData(
                    100,
                    fontFamily: 'Icons',
                  ),
                  text: 'Якофф',
                  iconSize: 40,
                ),
                GButton(
                  icon: IconData(
                    101,
                    fontFamily: 'Icons',
                  ),
                  text: 'Аккаунт',
                  iconSize: 40,
                ),
                GButton(
                  icon: IconData(
                    98,
                    fontFamily: 'Icons',
                  ),
                  text: 'Ваша еда',
                  iconSize: 40,
                ),
                GButton(
                  icon: IconData(
                    97,
                    fontFamily: 'Icons',
                  ),
                  text: 'Справочник',
                  iconSize: 40,
                ),
              ]),
        ),
      ),
      body: page[selected],
    );
  }

  navBarPage(iconName) {
    return Center(
      child: Icon(iconName),
    );
  }
}
