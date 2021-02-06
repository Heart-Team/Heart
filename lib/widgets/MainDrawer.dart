import 'package:flutter/material.dart';
import 'package:heart_app/screens/SurveyScreen.dart';
import 'package:heart_app/theme.dart';

import '../screens/LoginScreen.dart';
import '../screens/UserDetailsScreen.dart';
import '../screens/SignUpScreen.dart';

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
                'Login Screen',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/');
              },
            ),
            ListTile(
              title: Text(
                'Sign Up Screen',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/signup');
              },
            )
          ],
        ),
      ),
    );
  }
}
