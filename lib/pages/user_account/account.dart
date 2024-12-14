import 'package:bloom_body_balance/Userdataprovider.dart';

import 'package:bloom_body_balance/design/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final formkey = GlobalKey<FormState>();
  final formkey2 = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController femalecontroller = TextEditingController();

  final _dobController = TextEditingController();
  final _weightController = TextEditingController();
  final _heightController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<UserDataProvider>(context, listen: false).getUserData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserDataProvider>(context);

    String selectedGender = user.userData['gender'];

    String selectedActivity = user.userData['activity'];

    return Scaffold(
      body: user.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : CustomScrollView(slivers: <Widget>[
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
                    ],
                  ),
                )),
              ),
              SliverToBoxAdapter(
                child: Container(
                    margin: const EdgeInsets.only(top: 30),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.person,
                              size: 60,
                              color: primaryColorText,
                            ),
                            IconButton(
                              onPressed: user.auth.signOut,
                              icon: const Icon(Icons.exit_to_app_sharp),
                              color: primaryColorText,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(user.user!.email!),
                      ],
                    )),
              ),
              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.only(
                      top: 15, left: 25, right: 25, bottom: 15),
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: primaryColorSwitch,
                  ),
                  child: Form(
                      key: formkey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          buildTextField('name', 'Имя', nameController, user,
                              validateName),
                          buildTextField('secondname', 'Фамилия',
                              femalecontroller, user, validateName),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: WidgetStateProperty.all(
                                      primaryColorText)),
                              onPressed: () {
                                if (formkey.currentState!.validate()) {
                                  user.updateUserData(
                                      'name', nameController.text.trim());
                                  user.updateUserData('secondname',
                                      femalecontroller.text.trim());
                                  user.saveUserData(user.userData);
                                }
                              },
                              child: Text(
                                'Сохранить',
                                style: GoogleFonts.raleway(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          )
                        ],
                      )),
                ),
              ),
              SliverToBoxAdapter(
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          "Ваш пол",
                          style: GoogleFonts.raleway(
                              fontSize: 20,
                              color: primaryColorText,
                              fontWeight: FontWeight.w500),
                        ),
                        buildchooseField(
                            'gender', selectedGender, user, ['man', 'woman']),
                      ],
                    ),
                    const SizedBox(width: 50),
                    Column(
                      children: [
                        Text(
                          'Ваша активность',
                          style: GoogleFonts.raleway(
                              fontSize: 20,
                              color: primaryColorText,
                              fontWeight: FontWeight.w500),
                        ),
                        buildchooseField('activity', selectedActivity, user,
                            ['Level', 'Setendary', 'Modern', 'VeryActivity'])
                      ],
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.only(
                      top: 15, left: 25, right: 25, bottom: 15),
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: primaryColorSwitch,
                  ),
                  child: Form(
                      key: formkey2,
                      child: Column(children: [
                        buildTextField('dataBorn', 'Дата рождения',
                            _dobController, user, _validateDob),
                        buildTextField('height', 'Рост', _heightController,
                            user, _validateHeight),
                        buildTextField('weight', 'Вес', _weightController, user,
                            _validateWeight),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    WidgetStateProperty.all(primaryColorText)),
                            onPressed: () {
                              if (formkey2.currentState!.validate()) {
                                user.updateUserData(
                                    'dataBorn', int.parse(_dobController.text));
                                user.updateUserData('height',
                                    int.parse(_heightController.text));
                                user.updateUserData('weight',
                                    int.parse(_weightController.text));
                                user.saveUserData(user.userData);
                              }
                            },
                            child: Text(
                              'Сохранить',
                              style: GoogleFonts.raleway(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        )
                      ])),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.only(
                      top: 15, left: 25, right: 25, bottom: 15),
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: primaryColorSwitch,
                  ),
                  child: Form(child: Column()),
                ),
              )
            ]),
    );
  }

  String? validateName(value) {
    if (value == null || value.isEmpty || value.toString().length < 2) {
      return 'Некорректная запись';
    }
    return null;
  }

  String? _validateDob(value) {
    if (value == null || value.isEmpty || int.tryParse(value) == false) {
      return 'Введите дату рождения';
    }

    int year = int.parse(value);

    if (year < 1950 || year > 2020) {
      return 'Некорректный год рождения';
    }

    return null;
  }

  String? _validateHeight(value) {
    if (value == null || value.isEmpty || int.tryParse(value) == false)
      return 'Введите свой рост';

    int year = int.parse(value as String);

    if (year < 80 || year > 280) {
      return 'Некорректные данные о росте';
    }

    return null;
  }

  String? _validateWeight(value) {
    if (value == null || value.isEmpty || int.tryParse(value) == false)
      return 'Введите свой вес';

    int year = int.parse(value as String);

    if (year < 80 || year > 280) {
      return 'Некорректные данные о весе';
    }

    return null;
  }

  Widget buildchooseField(String key, String selectedvalue,
      UserDataProvider user, List<String> myitems) {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 25, right: 20, bottom: 15),
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: primaryColorSwitch,
      ),
      child: DropdownButton<String>(
        value: selectedvalue,
        items: myitems.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            selectedvalue = newValue!;
            user.updateUserData(key, selectedvalue);
            user.saveUserData(user.userData);
          });
          // Здесь можно добавить логику сохранения выбранного пола в Firestore
        },
      ),
    );
  }

  Widget ButtonSave(UserDataProvider user) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(primaryColorText)),
        onPressed: () {
          if (formkey2.currentState!.validate()) {
            user.updateUserData('name', nameController.text.trim());
            user.updateUserData('secondname', femalecontroller.text.trim());
            user.saveUserData(user.userData);
          }
        },
        child: Text(
          'Сохранить',
          style: GoogleFonts.raleway(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  Widget buildTextField(
      String key,
      String hinttext,
      TextEditingController controller,
      UserDataProvider user,
      FormFieldValidator<String>? valid) {
    final value = user.userData[key];
    final String displayValue = value is num
        ? value.toInt().toStringAsFixed(0)
        : value?.toString() ?? '';
    return TextFormField(
      style: GoogleFonts.raleway(
          color: primaryColorTextBlack,
          fontSize: 20,
          fontWeight: FontWeight.w600),
      controller: controller..text = user.userData[key].toString(),
      decoration: InputDecoration(
        labelText: hinttext,
        floatingLabelStyle: GoogleFonts.raleway(
          color: primaryColorText,
        ),
      ),
      validator: valid,
    );
  }
}
