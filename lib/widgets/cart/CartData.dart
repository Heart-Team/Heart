import "package:flutter/material.dart";

class CartData extends StatelessWidget {
  final String title;
  final String amount;
  final String img;

  CartData(this.title, this.amount, this.img);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: Row(
        children: [
          Container(
              width: 130,
              margin: EdgeInsets.only(left: 30),
              child: Image.asset(img)),
          Container(
            margin: EdgeInsets.only(top: 10, left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  child: Row(
                    children: [
                      Container(
                        child: Text(
                          "Amount ",
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Text(amount)
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
