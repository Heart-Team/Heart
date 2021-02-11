import 'package:flutter/material.dart';
import 'package:heart_app/screens/SurveyScreen1.dart';
import 'package:heart_app/screens/SurveyScreen2.dart';
import 'package:heart_app/screens/CharityInfoScreen.dart';
import 'package:heart_app/screens/SurveyScreen1.dart';
import 'package:heart_app/theme.dart';
import 'package:heart_app/screens/Cart.dart';

import '../screens/UserDetailsScreen.dart';
import '../screens/AuthScreen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: AppTheme().primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              title: Text(
                'Survey Screen 1',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              onTap: () {
                Navigator.pushReplacementNamed(context, SurveyScreen.routeName);
              },
            ),
            ListTile(
              title: Text(
                'Survey Screen 2',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              onTap: () {
                Navigator.pushReplacementNamed(
                    context, SurveyScreen2.routeName);
              },
            ),
            ListTile(
              title: Text(
                'User Details Screen',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              onTap: () {
                Navigator.pushReplacementNamed(
                    context, UserDetailsScreen.routeName);
              },
            ),
            ListTile(
              title: Text(
                'Auth Screen',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/');
              },
            ),
            ListTile(
              title: Text(
                'Charity Info Screen',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              onTap: () {
                Navigator.pushReplacementNamed(
                    context, CharityInfoScreen.routeName);
              },
            ),
            ListTile(
              title: Text(
                'Cart Screen',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              onTap: () {
                Navigator.pushReplacementNamed(context, Cart.routeName);
              },
            )
          ],
        ),
      ),
    );
  }
}
