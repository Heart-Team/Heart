import 'package:flutter/material.dart';
import 'package:heart_app/theme.dart';
import 'package:heart_app/widgets/MainDrawer.dart';
import "package:heart_app/widgets/cart/EmptyCart.dart";
import "package:heart_app/widgets/cart/CartData.dart";
// import "package:heart_app/bottomnav/BottomNavigation.dart";

class Cart extends StatefulWidget {
  static const routeName = '/cart';
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  final cartData = [
    {
      "title": "Cancer Awarness",
      "img": "assets/images/cart/cartimage1.png",
      "amount": "15"
    },
    {
      "title": "Animals Charity",
      "img": "assets/images/cart/cartimage2.png",
      "amount": "15"
    },
    {
      "title": "Childrens Charity",
      "img": "assets/images/cart/cartimage3.png",
      "amount": "15"
    }
  ];

//  final cartData = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(254, 254, 254, 1),
      extendBody: true,
      extendBodyBehindAppBar: true,
      drawer: MainDrawer(),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                "Your Cart",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            cartData.isEmpty
                ? EmptyCart()
                : Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(left: 30),
                    child: Text(
                      '${cartData.length} items',
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                  ),
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (ctx, index) => CartData(
                          cartData[index]['title'],
                          cartData[index]['amount'],
                          cartData[index]['img'],
                        ),
                        itemCount: cartData.length,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, bottom: 90),
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 7),
                      decoration: BoxDecoration(
                        color: AppTheme().primaryColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12.withOpacity(0.25),
                              blurRadius: 20)
                        ],
                      ),
                      child: GestureDetector(
                        onTap: () {},
                        child: Text(
                          cartData.isEmpty ? "Go Now" : "Next",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
