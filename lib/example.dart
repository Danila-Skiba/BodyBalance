import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExampleWindow extends StatefulWidget {
  const ExampleWindow({super.key});

  @override
  State<ExampleWindow> createState() => _ExampleWindowState();
}

class _ExampleWindowState extends State<ExampleWindow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Поиск рецептов'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showSearchBottomSheet(context),
          child: Text('Показать критерии поиска'),
        ),
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
        return Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 234, 255, 234), // Цве
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
                  Text('Время приготовления:'),
                  DropdownButton<String>(
                    style: Theme.of(context).textTheme.bodySmall,
                    value: 'Выберите',
                    items: [
                      'Выберите',
                      'До 15 мин',
                      '15-30 мин',
                      '30-60 мин',
                      'Более 60 мин'
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      // Обработка выбора
                    },
                  ),

                  // Имеющиеся ингредиенты (можно использовать TextField или другие элементы)
                  SizedBox(height: 16.0),
                  Text('Имеющиеся ингредиенты:'),
                  TextField(
                    decoration: InputDecoration(
                        hintText: 'Введите ингредиенты',
                        hintStyle: GoogleFonts.raleway(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black)),
                  ),

                  // Аллергены (Checkbox)
                  SizedBox(height: 16.0),
                  Text('Аллергены:'),
                  CheckboxListTile(
                    title: Text('Молоко'),
                    value: false,
                    onChanged: (value) {},
                  ),
                  CheckboxListTile(
                    title: Text('Глютен'),
                    value: false,
                    onChanged: (value) {},
                  ),
                  // ... другие аллергены ...

                  // Категория (Radio buttons)
                  SizedBox(height: 16.0),
                  Text('Категория:'),
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
                  Text('Тип диеты:'),
                  DropdownButton<String>(
                    value: 'Выберите',
                    items: [
                      'Выберите',
                      'Вегетарианство',
                      'Веганство',
                      'Без глютена',
                      'Другое'
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {},
                  ),

                  SizedBox(height: 16.0),
                  ElevatedButton(
                      onPressed: () {
                        //Обработка нажатия кнопки поиска
                        Navigator.pop(context);
                      },
                      child: Text('Найти рецепты'))
                ],
              ),
            ),
          ]),
        );
      },
    );
  }
}
