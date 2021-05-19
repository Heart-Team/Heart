import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:heart_app/Providers/User.dart';
import 'package:heart_app/widgets/Payment/EditBillingDialog.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class CreditCard extends StatefulWidget {
  final String cardNumber;
  final String expDate;
  final String name;
  final String type;
  final ItemScrollController itemScrollController; 
  final int index;
  final int cardsLength;

  CreditCard(this.cardNumber, this.expDate, this.name, this.type, {this.itemScrollController, this.index, this.cardsLength});

  @override
  _CreditCardState createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  FocusNode myFocusNode;
  final List<Color> colors = [
    Colors.lightGreen,
    Colors.lightBlue,
    Colors.redAccent,
    Colors.pink,
  ];
  final randomInt1 = Random().nextInt(4);

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

  void editInfo(BuildContext context, Map<String, dynamic> info, Map<String, dynamic> cardInfo, int index){
    Alert(
      buttons: [],
      style: AlertStyle(
        alertPadding: EdgeInsets.fromLTRB(0, 10, 0, 0),
        buttonAreaPadding: EdgeInsets.only(bottom: 10),
        titleStyle: TextStyle(fontWeight: FontWeight.w600)
      ),
      title: 'Edit Your Billing Info',
      context: context,
      content: EditBillingDialog(info, cardInfo, index)
    ).show();
  }

   Future<void> _showMyDialog(int index) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Card'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('This card will be permanently deleted. Are you sure you want to delete this payment method?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(
                'Yes',
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () async {
                await Provider.of<User>(context, listen: false).deleteCard(index);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget creditCardFront(GlobalKey<FlipCardState> cardKey, FocusNode focusNode,) {
    String number = Provider.of<User>(context, listen: false).decrypt(widget.cardNumber) ;
     String formattedNum = "";
     int count = 0;
     number.split('').forEach((el){
       if(count % 4 == 0){
         formattedNum += " ";
       }
       formattedNum += el;
       count++;
     });
    return Container(
      padding: EdgeInsets.only(right: 10, left: 10, bottom: 5),
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
      width: double.infinity,
      // height: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: colors[randomInt1],
        boxShadow: [
          BoxShadow(color: Colors.black12.withOpacity(0.25), blurRadius: 10)
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/payment/${widget.type}.png',
            width: 50,
          ), 
          Container( 
            padding: EdgeInsets.symmetric(horizontal: 8),
            margin: EdgeInsets.only(bottom: 10),
            child: Text( 
              widget.name,
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
            ),
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
                  formattedNum,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                SizedBox(
                  height: 10,
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
                    if (widget.cardsLength != null)
                    Container(
                      child: Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              _showMyDialog(widget.index);
                            }
                          ),
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
                          ),
                        ],
                      )
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

  Widget creditCardBack(
    GlobalKey<FlipCardState> cardKey, 
    FocusNode focusNode, 
    // BuildContext context, 
    Map<String, dynamic> billingInfo, 
    Map<String, dynamic> info,
  ) {
    final editedInfo = {
      'cardNumber': '',
      'expDate': ''
    };
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
      width: double.infinity,
      constraints: BoxConstraints(
        minHeight: 200 
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: colors[randomInt1],
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
                    'assets/images/payment/${widget.type}.png',
                    width: 50,
                  ),
                  IconButton(
                    icon: Icon(Icons.cancel_outlined, color: Colors.white),
                    onPressed: () {
                      cardKey.currentState.toggleCard();
                    }
                  )
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
                        initialValue: Provider.of<User>(context).decrypt(info['cardNumber']),
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
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10)
                        ),
                        onChanged: (val){
                          info['cardNumber'] = val;
                        },
                      ),
                    ),
                    SizedBox(height: 15),
                    SizedBox(
                      height: 40,
                      child: TextFormField(
                        initialValue: info['expDate'],
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
                              color: Colors.grey[300], width: 0.8)
                            ),
                          focusColor: Colors.red,
                          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        ),
                        onChanged: (val){
                          editedInfo['expDate'] = val;
                        },
                        onFieldSubmitted: (val) {
                          
                          Provider.of<User>(context, listen: false).updateCard(
                            info['fullName'], 
                            editedInfo['cardNumber'].isEmpty ? Provider.of<User>(context, listen: false).decrypt(info['cardNumber']) : editedInfo['cardNumber'], 
                            editedInfo['expDate'].isEmpty ? info['expDate'] : editedInfo['expDate'], 
                            billingInfo['streetAddress'], 
                            billingInfo['apt'],  
                            billingInfo['city'], 
                            billingInfo['state'], 
                            billingInfo['zipCode'], 
                            widget.index
                          );
                          cardKey.currentState.toggleCard();                          
                          
                        },
                      ),
                    ),
                    TextButton(
                      child: Text(
                        'Edit Billing Info',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                      onPressed: () => editInfo(context, billingInfo, info, widget.index)
                    )
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
    final billingInfo = Provider.of<User>(context, listen: false).cards[widget.index]['billingInfo'];
    final cardInfo = Provider.of<User>(context, listen: false).cards[widget.index]['cardInfo'];
    return FlipCard(
        key: cardKey,
        flipOnTouch: false,
        front: creditCardFront(cardKey, myFocusNode),
        back: creditCardBack(cardKey, myFocusNode, billingInfo, cardInfo)
    );
  }
}
