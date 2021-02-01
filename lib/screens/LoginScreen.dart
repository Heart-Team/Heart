import 'package:flutter/material.dart';
import '../theme.dart';
import '../widgets/MainDrawer.dart';
import '../widgets/SurveyGridItem.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: size.height,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 0,
              right: 0,
              child: Image.asset(
                "assets/images/login_screen/heart_figure.png",
                width: size.width * 0.55,
              ),
            )
          ],
        ),
      ),
    );
  }
}
