import 'package:flutter/material.dart';
import 'package:heart_app/widgets/MainDrawer.dart';

import '../theme.dart';
import '../widgets/CreditCard.dart';

class CharityInfoScreen extends StatelessWidget {
  static const routeName = '/charity-info';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      drawer: MainDrawer(),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(
                      "assets/images/charity_info_screen/poverty.jpg"),
                  fit: BoxFit.cover,
                )),
                padding: EdgeInsets.only(top: 300),
                child: null,
              ),
              Container(
                  padding: EdgeInsets.only(top: 60, left: 30),
                  alignment: Alignment.centerLeft,
                  child: Image.asset(
                    "assets/images/charity_info_screen/trending_flat_24px.png",
                    height: size.height * 0.03,
                  )),
              Container(
                padding: EdgeInsets.only(top: 260),
                // height: size.height,
                child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(children: [])),
              )
            ],
          ),
        ],
      ),
    );
  }
}
