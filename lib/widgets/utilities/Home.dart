import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:heart_app/Providers/User.dart';
import 'package:heart_app/screens/AuthScreen.dart';
import 'package:heart_app/screens/SurveyScreen1.dart';
import 'package:heart_app/screens/TabsScreen.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    
    final user = Provider.of<User>(context);

    return user.userId == null ? AuthScreen() : user.surveyTaken ? TabScreen() : SurveyScreen();
  }
}