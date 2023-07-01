import 'package:flutter/material.dart';

import '../screens/weather_screen.dart';
import '../screens/earthquake_screen.dart';
import '../widgets/app_drawer_widget.dart';

class MainMenuScreen extends StatefulWidget {
  const MainMenuScreen({Key? key}) : super(key: key);

  @override
  State<MainMenuScreen> createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
  int _selectedNavbar = 0;

  void _changeSelectedNavBar(int index) {
    setState(() {
      _selectedNavbar = index;
    });
  }

  final List<Widget> _screens = const [
    WeatherScreen(),
    EarthquakeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedNavbar],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.sunny),
            label: "Cuaca",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.waves),
            label: "Gempa",
          ),
        ],
        currentIndex: _selectedNavbar,
        showUnselectedLabels: true,
        onTap: _changeSelectedNavBar,
      ),
      drawer: const AppDrawerWidget(),
    );
  }
}
