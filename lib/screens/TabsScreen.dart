import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';


import 'package:heart_app/screens/HomeScreen.dart';
import 'package:heart_app/screens/SurveyScreen1.dart';
import 'package:heart_app/screens/SurveyScreen2.dart';
import 'package:heart_app/screens/UserDetailsScreen.dart';
import 'package:heart_app/theme.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {

  final List<Map<String, dynamic>> _pages = [
    {'page': HomeScreen()},
    {'page': SurveyScreen()},
    {'page': SurveyScreen2()},
    {'page': UserDetailsScreen()},
  ];
  int selectedIndex = 0;

  void selectTab(int index){
    setState(() {
      selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBody: true,
      backgroundColor: Colors.white, 
      bottomNavigationBar: SnakeNavigationBar.color(
        backgroundColor: Colors.white,
        behaviour: SnakeBarBehaviour.floating,
        snakeShape: SnakeShape.indicator,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        height: 60,
        elevation: 35,
        shadowColor: Colors.black87,
        snakeViewColor: AppTheme().primaryColor,
        selectedItemColor: AppTheme().primaryColor,
        unselectedItemColor: Colors.blueGrey,
        showUnselectedLabels: false,
        showSelectedLabels: true,

        currentIndex: selectedIndex,
        onTap: selectTab,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.filter_1), label: 'SS1'),
          BottomNavigationBarItem(icon: Icon(Icons.filter_2), label: 'SS2'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'My Details'),
        ],
      ),
      body: _pages[selectedIndex]['page'],
    );
  }
}