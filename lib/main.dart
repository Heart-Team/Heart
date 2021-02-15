import 'package:flutter/material.dart';
import 'package:heart_app/screens/CharityInfoScreen.dart';
import 'package:heart_app/screens/HomeScreen.dart';
import 'package:heart_app/screens/SurveyScreen2.dart';
import 'package:heart_app/screens/TabsScreen.dart';
import 'package:heart_app/screens/UserDetailsScreen.dart';
import 'package:heart_app/screens/AuthScreen.dart';
import 'package:heart_app/screens/Cart.dart';
import "package:heart_app/screens/TabsScreen.dart";
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
      debugShowCheckedModeBanner: false,
      title: 'Heart',
      theme: ThemeData(
        fontFamily: 'Poppins',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TabScreen(),
      routes: {
        SurveyScreen.routeName: (_) => SurveyScreen(),
        SurveyScreen2.routeName: (_) => SurveyScreen2(),
        UserDetailsScreen.routeName: (_) => UserDetailsScreen(),
        AuthScreen.routeName: (_) => AuthScreen(),
        CharityInfoScreen.routeName: (_) => CharityInfoScreen(),
        Cart.routeName: (_) => Cart(),
        TabScreen.routeName: (_) => TabScreen()
      },
    );
  }
}
