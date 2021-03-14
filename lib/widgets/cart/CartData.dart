import "package:flutter/material.dart";

class CartData extends StatefulWidget {
  final String title;
  final String amount;
  final String img;

  CartData(this.title, this.amount, this.img);

  @override
  _CartDataState createState() => _CartDataState();
}

class _CartDataState extends State<CartData> {
  TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController(text: '15');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Container(width: 130, child: Image.asset(widget.img)),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 10, left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      widget.title,
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          width: 100,
                          height: 35,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black12.withOpacity(0.15),
                                    blurRadius: 15)
                              ]),
                          margin: EdgeInsets.only(left: 20),
                          child: Stack(
                            children: [
                              Positioned(
                                child: Text(
                                  '\$',
                                  style: TextStyle(fontSize: 18),
                                ),
                                top: 4,
                                left: 13
                              ),
                              TextField(
                                // "\$$amount",
                                // style: TextStyle(fontSize: 20),
                                controller: _controller,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 18),
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none
                                  ),
                                  contentPadding: EdgeInsets.only(left: 30, top: 10, right: 30)
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 12,
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
