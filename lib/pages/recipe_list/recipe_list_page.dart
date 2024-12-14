import 'package:bloom_body_balance/pages/navbarcomponents.dart';
import 'package:flutter/material.dart';

class RecipeListPage extends StatelessWidget {
  const RecipeListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Тут будет список рецептов',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AppMainScreenState()),
                );
              },
              child: const Text('Рататуй'),
            ),
          ],
        ),
      ),
    );
  }
}
