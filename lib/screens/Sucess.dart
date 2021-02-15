import 'package:flutter/material.dart';
import 'package:heart_app/widgets/MainDrawer.dart';
// import "package:heart_app/bottomnav/BottomNavigation.dart";

class Suc extends StatefulWidget {
  static const routeName = '/suc';
  @override
  _SucState createState() => _SucState();
}

class _SucState extends State<Suc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: MainDrawer(),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              "Donation Successful",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Image.asset('assets/images/success.png'),
          Container(
            alignment: Alignment.center,
            child: Text(
              "Thank you for",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              "your donation",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
          ),
         ] ),
          );
  }
}
