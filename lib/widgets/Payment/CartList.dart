import 'package:flutter/material.dart';

class CartList extends StatelessWidget {
  final String title;
  final int amount;

  CartList(this.title, this.amount);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(title),
          Container(
              alignment: Alignment.topRight,
              child: Text(
                "\t\$${amount}",
              ))
        ],
      ),
    );
  }
}
