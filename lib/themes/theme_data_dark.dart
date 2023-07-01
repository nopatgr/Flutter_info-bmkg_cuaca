import 'package:flutter/material.dart';

ThemeData themeDataDark() {
  return ThemeData(
      brightness: Brightness.dark,
      primaryColor: const Color(0xFF393E46),
      scaffoldBackgroundColor: const Color(0xFF393E46),
      appBarTheme: const AppBarTheme(
        color: Color(0xFF222831),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(0xFF222831),
        selectedIconTheme: IconThemeData(
          color: Color(0xFFFFD369),
        ),
        selectedItemColor: Color(0xFFFFD369),
        unselectedIconTheme: IconThemeData(
          color: Color(0xFFEEEEEE),
        ),
        unselectedItemColor: Color(0xFFEEEEEE),
      ),
      drawerTheme: const DrawerThemeData(
        backgroundColor: Color(0xFF222831),
      ),
      dialogTheme: const DialogTheme(
        backgroundColor: Color(0xFF393E46),
      ));
}
