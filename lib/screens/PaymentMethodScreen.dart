import 'package:flutter/material.dart';
import 'package:heart_app/widgets/MainDrawer.dart';
import 'package:heart_app/widgets/Payment/CartList.dart';
import 'package:heart_app/theme.dart';

class PaymethodScreen extends StatelessWidget {
  static const routeName = '/paymentmethod';

  final donationList = [
    {"title": "Childrens Charity", "amount": 15},
    {"title": "Animals Charity", "amount": 15},
    {"title": "Social Charity", "amount": 15}
  ];

  @override
  Widget build(BuildContext context) {
    int totalAmount = 0;

    for (int i = 0; i < donationList.length; i++) {
      totalAmount += donationList[i]["amount"];
    }

    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      extendBodyBehindAppBar: true,
      drawer: MainDrawer(),
      body: Container(
          child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 30),
            alignment: Alignment.center,
            child: Text(
              "Payment Method",
              style: TextStyle(fontSize: 30),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: [
              Container(
                alignment: Alignment.center,
                width: 300,
                child: Image.asset(
                  "assets/images/payment/card.jpg",
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: 300,
                child: Image.asset(
                  "assets/images/payment/card.jpg",
                ),
              )
            ]),
          ),
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemBuilder: (ctx, index) => CartList(
                donationList[index]['title'],
                donationList[index]['amount'],
              ),
              itemCount: donationList.length,
            ),
          ),
          Container(
              margin: EdgeInsets.only(bottom: 100),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Total",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text("\$$totalAmount", style: TextStyle(fontSize: 20))
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 90),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 7),
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
                        "Checkout",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ))
        ],
      )),
    );
  }
}
