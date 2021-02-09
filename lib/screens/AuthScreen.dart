import "package:flutter/material.dart";

// widgets
import '../widgets/auth/AuthForm.dart';
import '../widgets/MainDrawer.dart';

class AuthScreen extends StatelessWidget{

  static const routeName = '/auth';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      drawer: MainDrawer(),
      backgroundColor: Colors.white,
      body: Container(
        height: size.height,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(children: [
            Container(
              alignment: Alignment.centerRight,
              child: Image.asset(
                "assets/images/login_screen/heart_figure.png",
                height: size.height * 0.3,
              ),
            ),
            AuthForm(size.height - size.height * 0.3),
          ])
        ),
      )
    );
  }
}
