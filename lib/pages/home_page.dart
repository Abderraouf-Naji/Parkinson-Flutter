import 'package:flutter/material.dart';
import 'package:Parkinson/pages/conseil_page.dart';
import 'package:Parkinson/pages/profile_page.dart';
import 'package:Parkinson/pages/test_page.dart';
import 'package:Parkinson/pages/notification.dart';
import 'package:Parkinson/pages/settings.dart'; // Importation de la page Settings

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  List<Widget> tabs = <Widget>[
    const ConseilPage(),
    const TestPage(),
    const ProfilePage(),
    const NotificationsPage(),
    const SettingsPage(), // Ajout de la page Settings
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: tabs[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.lightbulb_outline),
            label: 'Conseil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assessment),
            label: 'Test',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Paramètres',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Color.fromARGB(255, 2, 3, 51),
        showUnselectedLabels: true,
        onTap: _onItemTapped,
        backgroundColor: Colors.white,
        elevation: 8,
        selectedFontSize: 18,
      ),
    );
  }

  void _onItemTapped(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }
}
