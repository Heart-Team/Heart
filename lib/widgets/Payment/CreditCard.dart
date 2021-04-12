import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class CreditCard extends StatefulWidget {
  final String cardNumber;
  final String expDate;
  final List<int> colorsSelected;
  final ItemScrollController itemScrollController;
  final int index;
  final int cardsLength;

  CreditCard(this.cardNumber, this.expDate, this.colorsSelected,
      {this.itemScrollController, this.index, this.cardsLength});

  @override
  _CreditCardState createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  FocusNode myFocusNode;
  final List<Color> colors = [
    Colors.lightGreenAccent,
    Colors.lightBlue,
    Colors.redAccent,
    Colors.pink,
  ];

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    myFocusNode.dispose();
    super.dispose();
  }

  Widget creditCardFront(
      GlobalKey<FlipCardState> cardKey, FocusNode focusNode) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
      width: double.infinity,
      height: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
            colors: [
              colors[widget.colorsSelected[0]],
              colors[widget.colorsSelected[1]]
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0, 1]),
        boxShadow: [
          BoxShadow(color: Colors.black12.withOpacity(0.25), blurRadius: 10)
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
                  style: TextStyle(color: Colors.white, fontSize: 16),
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
                          '${widget.expDate}',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    if (widget.index != null)
                      IconButton(
                        icon: Icon(
                          Icons.edit_outlined,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          cardKey.currentState.toggleCard();
                          if (widget.index < widget.cardsLength - 1)
                            widget.itemScrollController.scrollTo(
                                index: widget.index,
                                duration: Duration(milliseconds: 400));
                        },
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

  Widget creditCardBack(GlobalKey<FlipCardState> cardKey, FocusNode focusNode) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
      width: double.infinity,
      height: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
            colors: [
              colors[widget.colorsSelected[0]],
              colors[widget.colorsSelected[1]]
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0, 1]),
        boxShadow: [
          BoxShadow(color: Colors.black12.withOpacity(0.25), blurRadius: 10)
        ],
      ),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/images/visa.png',
                    width: 50,
                  ),
                  IconButton(
                      icon: Icon(Icons.cancel_outlined, color: Colors.white),
                      onPressed: () {
                        cardKey.currentState.toggleCard();
                      })
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 40,
                      child: TextFormField(
                        focusNode: focusNode,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.credit_card,
                                color: Colors.grey[200]),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(style: BorderStyle.none)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(style: BorderStyle.none)),
                            disabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.grey[300], width: 0.8)),
                            focusColor: Colors.red,
                            hintText: "1234 5678 9012 3456",
                            hintStyle: TextStyle(
                                color: Colors.grey[200],
                                fontWeight: FontWeight.w600),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10)),
                      ),
                    ),
                    SizedBox(height: 15),
                    SizedBox(
                      height: 40,
                      child: TextFormField(
                        keyboardType: TextInputType.datetime,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.calendar_today,
                              color: Colors.grey[200]),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(style: BorderStyle.none)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(style: BorderStyle.none)),
                          disabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey[300], width: 0.8)),
                          focusColor: Colors.red,
                          hintText: "MM/YYYY",
                          hintStyle: TextStyle(
                              color: Colors.grey[200],
                              fontWeight: FontWeight.w600),
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        ),
                        onFieldSubmitted: (val) {
                          cardKey.currentState.toggleCard();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FlipCard(
        key: cardKey,
        flipOnTouch: false,
        front: creditCardFront(cardKey, myFocusNode),
        back: creditCardBack(cardKey, myFocusNode));
  }
}
