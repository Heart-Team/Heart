import 'package:flutter/material.dart';
import 'package:heart_app/theme.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 60,
          width: 60,
          child: CircularProgressIndicator(
            backgroundColor: AppTheme().primaryColor
          )
        ),
      ),
    );
  }
}