import 'package:flutter/material.dart';

class CartList extends StatelessWidget {
  final String title;
  final String amount;

  CartList(this.title, this.amount);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
          Expanded(child: Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          )),
          SizedBox(width: 10,),
          Container(
            alignment: Alignment.topRight,
            child: Text(
              "\t\$$amount",
              style: TextStyle(fontSize: 18),
            )
          )
        ],
      ),
    );
  }
}
