import 'package:flutter/material.dart';
import 'package:heart_app/widgets/MainDrawer.dart';

class HomeScreen extends StatelessWidget {
    
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      body: Center(
        child: Text('Home Screen'),
      ),
    );
  }
}