import 'package:flutter/material.dart';
import 'package:heart_app/widgets/MainDrawer.dart';
// import "package:heart_app/bottomnav/BottomNavigation.dart";

class Cart extends StatefulWidget {
  static const routeName = '/cart';
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
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
              "Your Cart",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Image.asset('assets/images/cart/emptycart.png'),
          Container(
            alignment: Alignment.center,
            child: Text(
              "Go Checkout some",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              "good Causes",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 7),
            decoration: BoxDecoration(
              color: Color(0xFFFF6464),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black12.withOpacity(0.25), blurRadius: 20)
              ],
            ),
            child: GestureDetector(
              onTap: () {},
              child: Text(
                "Go Now",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
