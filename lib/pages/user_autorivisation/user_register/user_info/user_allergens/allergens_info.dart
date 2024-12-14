import 'package:bloom_body_balance/Userdataprovider.dart';
import 'package:bloom_body_balance/design/colors.dart';
import 'package:bloom_body_balance/pages/user_autorivisation/components/appbars.dart';
import 'package:bloom_body_balance/pages/user_autorivisation/user_register/user_info/components/buttonnext.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AllergensPage extends StatefulWidget {
  const AllergensPage({super.key});

  @override
  State<AllergensPage> createState() => _AllergensPageState();
}

class _AllergensPageState extends State<AllergensPage> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> selectedAllergens = [];
  final List<String> _filteredAllergies = [];
  final List<String> allAllergens = [
    'Глютен',
    'Лактоза',
    'Белок',
    'Помидор',
    'Треска',
    'Куриное мясо',
    'Клубника',
    'Малина',
    'Чёрная смородина',
    'Миндаль',
    'Грецкие орехи',
    'Арахис',
    'Пшеница',
    'Цитрусовые',
    'Соя',
    'Кунжут',
  ];

  @override
  void initState() {
    super.initState();

    _searchController.addListener(_filterAllergies);
  }

  void _filterAllergies() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredAllergies.clear();
      _filteredAllergies.addAll(allAllergens
          .where((allergy) => allergy.toLowerCase().contains(query))
          .toList());
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userDataProvider = Provider.of<UserDataProvider>(context);
    return Scaffold(
        appBar: AppBarsBuild(
          hieght: 110,
          image1: 'assets/images/Vectors/yellowvector1.svg',
          image2: 'assets/images/Vectors/greenvector1.svg',
          leading: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/usernickname');
              },
              icon: const Icon(
                Icons.arrow_back_sharp,
                size: 30,
                color: Colors.grey,
              )),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(children: [
              Container(
                  padding: const EdgeInsets.only(left: 10),
                  child: const Image(
                    image: AssetImage('assets/images/assistent2.png'),
                    width: 150,
                    height: 150,
                  )),
              SizedBox(
                width: 200,
                height: 100,
                child: RichText(
                    text: TextSpan(children: <TextSpan>[
                  TextSpan(
                    text: 'Укажите имеющиеся ',
                    style: GoogleFonts.raleway(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  TextSpan(
                    text: 'аллергены',
                    style: GoogleFonts.raleway(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: primaryColorText),
                  ),
                ])),
              ),
            ]),
            Padding(
              padding: const EdgeInsets.all(17.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                    hintText: 'Поиск аллергена...',
                    hintStyle: GoogleFonts.raleway(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: primaryColorText),
                    focusColor: primaryColorSwitch,
                    hoverColor: primaryColorText),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: ListView.builder(
                  itemCount: _filteredAllergies.length,
                  itemBuilder: (context, index) {
                    final allergy = _filteredAllergies[index];
                    return CheckboxTheme(
                      data: CheckboxThemeData(
                        checkColor:
                            WidgetStatePropertyAll(primaryColorTextBlack),
                        fillColor: WidgetStatePropertyAll(primaryColorSwitch),
                        side: const BorderSide(color: primaryColor, width: 2),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      child: CheckboxListTile(
                        title: Container(
                            padding: EdgeInsets.all(7),
                            decoration: BoxDecoration(
                                border: Border.all(color: primaryColorSwitch),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                color: primaryColorSwitch),
                            child: Text(
                              allergy,
                              style: GoogleFonts.raleway(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            )),
                        value: selectedAllergens.contains(allergy),
                        onChanged: (value) {
                          setState(
                            () {
                              if (value!) {
                                selectedAllergens.add(allergy);
                              } else {
                                selectedAllergens.remove(allergy);
                              }
                            },
                          );
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ChipTheme(
                data: ChipThemeData(
                    backgroundColor: Colors.white,
                    labelStyle: GoogleFonts.raleway(
                        color: primaryColorText,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: primaryColorText, width: 2),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6)),
                child: Wrap(
                  spacing: 8.0,
                  children: selectedAllergens
                      .map((allergy) => Chip(
                            label: Text(allergy),
                            onDeleted: () {
                              setState(() {
                                selectedAllergens.remove(allergy);
                              });
                            },
                          ))
                      .toList(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: ButtonNext(function: () {
                userDataProvider.updateUserData('allergens', selectedAllergens);
                Navigator.pushNamed(context, '/helpermessage');
              }),
            ),
          ],
        ));
  }
}

/*class CustomCheckbox extends StatefulWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;

  const CustomCheckbox({Key? key, required this.value, required this.onChanged})
      : super(key: key);

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onChanged(!widget.value),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: widget.value ? Colors.green : Colors.grey, // Цвет фона
          border: Border.all(color: Colors.black, width: 2), // Обводка
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: widget.value
              ? Icon(Icons.check,
                  color: Colors.white, size: 16) // Иконка галочки
              : null,
        ),
      ),
    );
  }
}*/
