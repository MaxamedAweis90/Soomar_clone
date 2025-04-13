import 'package:flutter/material.dart';
import 'package:soomar_clone/Pages/home.dart';

import 'colors.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Grab the current theme's properties.
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text uses the custom text style defined in your theme.
            Text(
              'Welcome to Soomar Clone!',
              style: theme.textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            // ElevatedButton inherits styling from the elevatedButtonTheme.
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: const Text(
                'Start with Soomar',
                style: TextStyle(fontSize: 18, color: AppColors.accentColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
