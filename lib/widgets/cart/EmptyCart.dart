import "package:flutter/material.dart";

class EmptyCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
      ],
    );
  }
}
