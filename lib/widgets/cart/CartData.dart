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
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Container(
              width: 130,
              child: Image.asset(img)),
<<<<<<< HEAD
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
=======
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 10, left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomLeft,
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Amount ",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 20),
                          ),
>>>>>>> e3711e351d17115170019ffcf8ee1c1b23d3fc62
                        ),
                        Text(amount)
                      ],
                    ),
                  ),
                  SizedBox(height: 15,)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
