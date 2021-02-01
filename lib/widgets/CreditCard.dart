import 'package:flutter/material.dart';

class CreditCard extends StatelessWidget {

  final String cardNumber;
  final String expDate;
  final List<int> colorsSelected;

  final List<Color> colors = [
    Colors.lightGreenAccent,
    Colors.lightBlue,
    Colors.redAccent,
    Colors.pink,
  ];

  CreditCard(
    this.cardNumber,
    this.expDate,
    this.colorsSelected,
  );



  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
      width: double.infinity,
      height: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: [
            colors[colorsSelected[0]],
            colors[colorsSelected[1]]
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0,1]
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.25),
            blurRadius: 10
          ) 
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/visa.png',
            width: 50,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Card Number',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '**** **** **** 1234',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Valid Through',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          '$expDate',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.edit_outlined,
                      color: Colors.white,
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}