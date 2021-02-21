import 'package:flutter/material.dart';
import 'package:heart_app/screens/Profile1.dart';
import 'package:heart_app/screens/SavedCharitiesScreen.dart';
import 'package:heart_app/screens/Sucess.dart';
import 'package:heart_app/screens/SurveyScreen1.dart';
import 'package:heart_app/screens/SurveyScreen2.dart';
import 'package:heart_app/theme.dart';
import 'package:heart_app/screens/Cart.dart';
import "package:heart_app/screens/TabsScreen.dart";
import "package:heart_app/screens/PaymentMethodScreen.dart";
import '../screens/FinanceScreen.dart';
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
                Navigator.pushReplacementNamed(context, AuthScreen.routeName);
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
            ),
            ListTile(
              title: Text(
                'Tab Screen',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              onTap: () {
                Navigator.pushReplacementNamed(context, TabScreen.routeName);
              },
            ),
            ListTile(
              title: Text(
                'Success Screen',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              onTap: () {
                Navigator.pushReplacementNamed(context, Suc.routeName);
              },
            ),
            ListTile(
              title: Text(
                'Saved Charity Screen',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              onTap: () {
                Navigator.pushReplacementNamed(
                    context, SavedCharitiesScreen.routeName);
              },
            ),
            ListTile(
              title: Text(
                'Finance Screen',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              onTap: () {
                Navigator.pushReplacementNamed(
                    context, FinanceScreen.routeName);
              },
            ),
            ListTile(
              title: Text(
                'Payment Method',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              onTap: () {
                Navigator.pushReplacementNamed(
                    context, PaymethodScreen.routeName);
              },
            ),
            ListTile(
              title: Text(
                'Profile',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              onTap: () {
                Navigator.pushReplacementNamed(
                    context, Profile.routeName);
              },
            )
          ],
        ),
      ),
    );
  }
}
