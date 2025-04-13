import 'package:flutter/material.dart';
import 'start.dart';
import 'colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Soomar Clone',
      theme: ThemeData(
        useMaterial3: true, // Optional: enables Material 3 styling
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: AppColors.mainColor,
          onPrimary: AppColors.accentColor, // Text/icons on primary
          secondary: AppColors.secondaryColor,
          onSecondary: Colors.black, // Contrast text for secondary
          error: Colors.red, // default error color; adjust as needed
          onError: AppColors.accentColor,
          surface: AppColors.accentColor,
          onSurface: Colors.black,
        ),
        scaffoldBackgroundColor: AppColors.secondaryColor,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.mainColor,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        // Define text styling that uses the accent color where needed.
        textTheme: const TextTheme(
          // You can adjust the text style as needed
          bodyLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.accentColor,
            shadows: [],
          ),
        ),
      ),
      home: const StartPage(),
    );
  }
}
