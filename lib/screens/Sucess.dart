import 'package:flutter/material.dart';
import 'package:heart_app/theme.dart';
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 30,
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              "Donation Successful",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Image.asset('assets/images/success.png'),
          Container(
            alignment: Alignment.center,
            child: Text(
              "Thank you for\nyour donation",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(height: 30),
          MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            ),
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 6),
            color: AppTheme().primaryColor,
            child: Text(
              'All Done',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white
              )
            ),
            onPressed: (){
              Navigator.of(context).pushNamedAndRemoveUntil('/tab', (route) => false);
            }
          )
        ] 
      ),
    );
  }
}
