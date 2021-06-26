import 'package:emp/screens/settings.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class BottomBar extends StatefulWidget {
  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Settings',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new IndexedStack(
        index: _selectedIndex,
        children: <Widget>[
          new Home(),
          new SettingScreen(),
        ],
      ),
      bottomNavigationBar: new Theme(
        data: Theme.of(context).copyWith(
            shadowColor: Colors.white,
            canvasColor:
                MediaQuery.of(context).platformBrightness == Brightness.dark
                    ? Colors.black
                    : Colors.black12),
        child: BottomNavigationBar(
          elevation: 0,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
          showUnselectedLabels: true,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          unselectedItemColor:
              MediaQuery.of(context).platformBrightness == Brightness.dark
                  ? Colors.white30
                  : Colors.black54,
          selectedItemColor:
              MediaQuery.of(context).platformBrightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
        ),
      ),
    );
  }
}
