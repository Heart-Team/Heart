import 'package:flutter/material.dart';

class CartList extends StatelessWidget {
  final String title;
  final int amount;

  CartList(this.title, this.amount);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(color: Colors.black12.withOpacity(0.15), blurRadius: 15)
          ]),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
