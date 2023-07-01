import 'package:flutter/material.dart';

ThemeData themeDataLight() {
  return ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xFFFAF9F9),
    appBarTheme: const AppBarTheme(
      color: Color(0xFF488B8F),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF488B8F),
      selectedIconTheme: IconThemeData(
        color: Color.fromARGB(255, 217, 248, 241),
      ),
      selectedItemColor: Color.fromARGB(255, 217, 248, 241),
      unselectedIconTheme: IconThemeData(
        color: Color.fromARGB(255, 157, 206, 206),
      ),
      unselectedItemColor: Color.fromARGB(255, 157, 206, 206),
    ),
  );
}
