import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDarkMode = true;

  bool get isDarkMode => _isDarkMode;

  ThemeProvider() {
    initialState();
  }

  void initialState() async {
    await syncDataWithProvider();
  }

  // Toggle dark theme / light theme

  Future<void> toggleIsDarkMode() async {
    _isDarkMode = !_isDarkMode;

    await updateSharedPrefrences();

    notifyListeners();
  }

  // Update shared preferences

  Future<void> updateSharedPrefrences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setBool("theme", _isDarkMode);
  }

  // Sync _isDarkMode dan shared preferences

  Future<void> syncDataWithProvider() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getBool("theme") == null) {
      await prefs.setBool("theme", _isDarkMode);
    }

    _isDarkMode = prefs.getBool("theme")!;

    notifyListeners();
  }
}
