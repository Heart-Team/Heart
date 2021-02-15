import 'package:flutter/material.dart';
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
          Column(
            children: [
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
              Container(
                height: 420,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (ctx, index) => CartData(
                    cartData[index]['title'],
                    cartData[index]['amount'],
                    cartData[index]['img'],
                  ),
                  itemCount: cartData.length,
                ),
              )
            ],
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
