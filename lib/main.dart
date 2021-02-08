import 'package:flutter/material.dart';
import 'package:heart_app/screens/CharityInfoScreen.dart';
import 'package:heart_app/screens/HomeScreen.dart';
import 'package:heart_app/screens/SurveyScreen2.dart';
import 'package:heart_app/screens/UserDetailsScreen.dart';
import 'package:heart_app/screens/AuthScreen.dart';
// screens
import 'screens/SurveyScreen1.dart';
import 'screens/AuthScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Heart',
      theme: ThemeData(
        fontFamily: 'Poppins',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // temporarily made survey screen the home screen
      home: AuthScreen(),
      routes: {
        SurveyScreen.routeName: (_) => SurveyScreen(),
        SurveyScreen2.routeName: (_) => SurveyScreen2(),
        UserDetailsScreen.routeName: (_) => UserDetailsScreen(),
        HomeScreen.routeName: (_) => HomeScreen(),
        CharityInfoScreen.routeName: (_) => CharityInfoScreen(),
      },
    );
  }
}
