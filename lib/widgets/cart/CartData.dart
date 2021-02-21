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
          Container(width: 130, child: Image.asset(img)),
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
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
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
                            style: TextStyle(fontSize: 22),
                          ),
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(227, 227, 227, 1)
                                    .withOpacity(0.5),
                                spreadRadius: 3,
                                blurRadius: 1,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          margin: EdgeInsets.only(left: 20),
                          child: Text(
                            amount,
                            style: TextStyle(fontSize: 20),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
