import 'package:bloom_body_balance/design/colors.dart';
import 'package:bloom_body_balance/pages/Recieps/recipe_card/recipe_card_page.dart';
import 'package:bloom_body_balance/pages/user_autorivisation/user_register/user_info/components/buttonnext.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Screenhomerecieps extends StatefulWidget {
  const Screenhomerecieps({super.key});

  @override
  State<Screenhomerecieps> createState() => _ScreenhomereciepsState();
}

class _ScreenhomereciepsState extends State<Screenhomerecieps> {
  final TextEditingController _ingredientController = TextEditingController();
  List<String> filteredIngredients = [];
  int selectedCookTime = 0;
  bool considerAllergies = false;
  List<String> selectedcategory = [];
  List<String> selectedIngredients = [];
  final List<String> ingredientsList = [
    'Мука', 'Сахар', 'Яйца', 'Молоко', 'Сливочное масло', 'Соль', 'Перец',
    'Картофель',
    'Лук', 'Морковь', 'Мясо', 'Рыба', 'Сыр', 'Помидоры', 'Огурцы', 'Петрушка',
    'Укроп',
    'Гречка', 'Рис', 'Курица', 'Говядина', 'Свинина', 'Лимон', 'Чеснок',
    'Кинза',
    // ... Добавьте больше ингредиентов ...
  ];

  String searchQuery = '';

  void _filterIngredients() {
    final query = _ingredientController.text.toLowerCase();
    setState(() {
      filteredIngredients.clear();
      filteredIngredients.addAll(ingredientsList
          .where((allergy) => allergy.toLowerCase().contains(query))
          .toList());
    });
  }

  @override
  void dispose() {
    _ingredientController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    filteredIngredients.addAll(ingredientsList);
    _ingredientController.addListener(_filterIngredients);
  }

  @override
  Widget build(BuildContext context) {
    // Фильтруем рецепты на основе введённого текста
    /*final filteredRecipes = recipes
        .where((recipe) =>
            recipe['title']!.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();*/

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
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
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Питание',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal, // Обычный шрифт
                    color: Colors.black,
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  'Рецепты',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold, // Жирный шрифт
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 40, bottom: 10),
            child: TextFormField(
              keyboardType: TextInputType.text,
              onChanged: (value) {
                setState(() {
                  searchQuery = value; // Обновляем состояние для поиска
                });
              },
              decoration: InputDecoration(
                hintText: 'Поиск рецептов',
                hintStyle: TextStyle(color: Colors.grey.shade600),
                prefixIcon: Icon(Icons.search, color: primaryColorText),
                filled: true,
                fillColor: const Color.fromARGB(51, 58, 92, 28),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
              style: TextStyle(color: primaryColorText),
            ),
          ),

          Padding(
            padding:
                const EdgeInsets.only(top: 0, left: 60, right: 60, bottom: 20),
            child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(accentprimaryColor),
                ),
                onPressed: () => _showSearchBottomSheet(context),
                child: Row(
                  children: [
                    Icon(
                      Icons.search_off_rounded,
                      color: primaryColorText,
                    ),
                    Text(
                      'Расширенный поиск',
                      style: GoogleFonts.raleway(
                          fontSize: 18, color: Colors.black),
                    )
                  ],
                )),
          ),
          // Список рецептов
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('recieps')
                  .limit(7)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text('Ошибка: ${snapshot.error}'));
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                final recipes = snapshot.data!.docs;

                return ListView(
                  children: recipes.map((recipe) {
                    final data = recipe.data() as Map<String, dynamic>;

                    // Проверяем, что все необходимые поля существуют
                    if (data['name'] == null ||
                        data['instructions'] == null ||
                        data['nutritionFacts'] == null ||
                        data['imageUrl'] == null) {
                      return Container(); // Пропускаем документ, если данные неполные
                    }

                    // Преобразуем массив инструкций в строку
                    final instructions = data['instructions'] != null
                        ? data['instructions'].join(', ')
                        : 'Инструкции отсутствуют';

                    return RecipeCard(
                      recipe: {
                        'name': data['name'],
                        'instructions':
                            instructions, // Передаём обработанные инструкции
                        'nutritionFacts': data['nutritionFacts'],
                        'imageUrl': data['imageUrl'],
                      },
                      recipeId: recipe.id,
                    );
                  }).toList(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showSearchBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(40.0)), // Закругленные углы сверху
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setStateBottomSheet) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white, // Цвет
              borderRadius: BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5), // Цвет тени
                  spreadRadius: 5,
                  blurRadius: 10,
                  offset: Offset(0, 3), // Смещение тени
                ),
              ],
            ),
            padding: EdgeInsets.all(16.0),
            child: CustomScrollView(slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text('Критерии поиска',
                        style: GoogleFonts.raleway(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: Colors.black)),
                    SizedBox(height: 16.0),
                    // Время приготовления
                    Text('Время приготовления:',
                        style: GoogleFonts.raleway(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.black)),
                    DropdownButton<int>(
                      value: selectedCookTime,
                      items: [0, 15, 30, 60, 90, 120]
                          .map((int value) => DropdownMenuItem<int>(
                                value: value,
                                child: Text('$value мин'),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setStateBottomSheet(() {
                          selectedCookTime = value!;
                        });
                      },
                    ),

                    // Имеющиеся ингредиенты (можно использовать TextField или другие элементы)
                    SizedBox(height: 16.0),
                    Text('Имеющиеся ингредиенты:',
                        style: GoogleFonts.raleway(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.black)),
                    Padding(
                      padding: const EdgeInsets.all(17.0),
                      child: TextField(
                        controller: _ingredientController,
                        decoration: InputDecoration(
                            hintText: 'Поиск ингредиента...',
                            hintStyle: GoogleFonts.raleway(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: primaryColorText),
                            focusColor: primaryColorSwitch,
                            hoverColor: primaryColorText),
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
                              side:
                                  BorderSide(color: primaryColorText, width: 2),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6)),
                        child: Wrap(
                          spacing: 8.0,
                          children: selectedIngredients
                              .map((allergy) => Chip(
                                    label: Text(allergy),
                                    onDeleted: () {
                                      setStateBottomSheet(() {
                                        selectedIngredients.remove(allergy);
                                      });
                                    },
                                  ))
                              .toList(),
                        ),
                      ),
                    ),

                    SizedBox(height: 8.0),
                    Container(
                      height:
                          160, // Устанавливаем фиксированную высоту для списка ингредиентов
                      child: SingleChildScrollView(
                        child: Column(
                          children: filteredIngredients.map((allergy) {
                            return CheckboxTheme(
                              data: CheckboxThemeData(
                                checkColor: WidgetStateProperty.all(
                                    primaryColorTextBlack),
                                fillColor:
                                    WidgetStateProperty.all(primaryColorSwitch),
                                side: const BorderSide(
                                    color: primaryColor, width: 2),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                              child: CheckboxListTile(
                                title: Container(
                                    padding: EdgeInsets.all(7),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: primaryColorSwitch),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        color: primaryColorSwitch),
                                    child: Text(
                                      allergy,
                                      style: GoogleFonts.raleway(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    )),
                                value: selectedIngredients.contains(allergy),
                                onChanged: (value) {
                                  setStateBottomSheet(() {
                                    if (value!) {
                                      selectedIngredients.add(allergy);
                                    } else {
                                      selectedIngredients.remove(allergy);
                                    }
                                  });
                                },
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),

                    // Аллергены (Checkbox)

                    SizedBox(height: 16),
                    CheckboxListTile(
                      title: Text(
                        'Учитывать аллергены',
                        style: GoogleFonts.raleway(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      value: considerAllergies,
                      onChanged: (value) {
                        setStateBottomSheet(() {
                          considerAllergies = value!;
                        });
                      },
                    ),
                    // ... другие аллергены ...

                    // Категория (Radio buttons)
                    SizedBox(height: 16.0),
                    Text('Категория:',
                        style: GoogleFonts.raleway(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.black)),
                    RadioListTile<String>(
                      title: Text('Завтрак'),
                      value: 'Завтрак',
                      groupValue: 'Выберите',
                      onChanged: (value) {},
                    ),
                    RadioListTile<String>(
                      title: Text('Обед'),
                      value: 'Обед',
                      groupValue: 'Выберите',
                      onChanged: (value) {},
                    ),
                    // ... другие категории ...

                    // Тип диеты (DropdownButton)
                    SizedBox(height: 16.0),
                    Text('Тип диеты:',
                        style: GoogleFonts.raleway(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.black)),
                    DropdownButton<int>(
                      value: selectedCookTime,
                      items: [0, 15, 30, 60, 90, 120]
                          .map((int value) => DropdownMenuItem<int>(
                                value: value,
                                child: Text('$value мин'),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setStateBottomSheet(() {
                          selectedCookTime = value!;
                        });
                      },
                    ),

                    SizedBox(height: 16.0),
                    ButtonNext(
                      function: () {},
                      name: 'Найти рецепты',
                    )
                  ],
                ),
              ),
            ]),
          );
        });
      },
    );
  }
}

class RecipeCard extends StatelessWidget {
  final Map<String, dynamic> recipe;
  final String recipeId; // Добавляем id рецепта

  const RecipeCard({
    required this.recipe,
    required this.recipeId, // Передаём id рецепта
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Card(
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: primaryColorText),
        ),
        color: primaryColorSwitch,
        child: InkWell(
          // Добавляем InkWell для обработки нажатия
          onTap: () {
            // Переход на страницу RecipeCardPage с передачей id рецепта
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RecipeCardPage(
                  recipeId: recipeId, // Передаём id рецепта
                ),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Изображение рецепта
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey.shade200,
                    image: DecorationImage(
                      image: NetworkImage(recipe['imageUrl'] ??
                          'https://example.com/default_image.jpg'), // Используем дефолтное изображение, если imageUrl отсутствует
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 16),
                // Информация о рецепте
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Название рецепта
                      Text(
                        recipe['name'] ??
                            'Без названия', // Используем дефолтное значение, если name отсутствует
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      SizedBox(height: 8),
                      // Описание рецепта
                      Text(
                        recipe['instructions'] ??
                            'Инструкции отсутствуют', // Используем дефолтное значение, если instructions отсутствуют
                        style: TextStyle(
                            color: Colors.grey.shade700, fontSize: 14),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 8),
                      // Пищевая ценность
                      Text(
                        'Пищевая ценность на 100г: ${recipe['nutritionFacts']['calories'] ?? 0} ккал, Б: ${recipe['nutritionFacts']['proteins'] ?? 0}г, Ж: ${recipe['nutritionFacts']['fats'] ?? 0}г, У: ${recipe['nutritionFacts']['carbohydrates'] ?? 0}г',
                        style: TextStyle(
                            color: Colors.grey.shade600, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
