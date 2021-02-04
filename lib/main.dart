import 'package:flutter/material.dart';
import 'package:heart_app/screens/LoginScreen.dart';
import 'package:heart_app/screens/UserDetailsScreen.dart';
// screens
import './screens/SurveyScreen.dart';

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
      home: LoginScreen(),
      routes: {
        SurveyScreen.routeName: (_) => SurveyScreen(),
        UserDetailsScreen.routeName: (_) => UserDetailsScreen()
      },
    );
  }
}
