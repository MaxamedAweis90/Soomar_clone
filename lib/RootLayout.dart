import 'package:flutter/material.dart';
import 'package:soomar_clone/Pages/home.dart';
import 'package:soomar_clone/Pages/favorite.dart';
import 'package:soomar_clone/Pages/support.dart';
import 'package:soomar_clone/components/bottom_nav.dart';

class RootLayout extends StatefulWidget {
  const RootLayout({super.key});

  @override
  State<RootLayout> createState() => _RootLayoutState();
}

class _RootLayoutState extends State<RootLayout> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const FavoritePage(),
    const SupportPage(),
    Center(child: Text("Profile")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNav(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
