import 'package:bloom_body_balance/pages/navbarcomponents.dart';
import 'package:flutter/material.dart';

class RecipeInstructionsPage extends StatelessWidget {
  const RecipeInstructionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Тут будет инструкция готовки',
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
              child: const Text('Обратно'),
            ),
          ],
        ),
      ),
    );
  }
}
