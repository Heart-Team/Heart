import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:heart_app/Providers/User.dart';
import 'package:provider/provider.dart';
import './CreditCard.dart';

class CreditCardSlider extends StatefulWidget {
  @override
  _CreditCardSliderState createState() => _CreditCardSliderState();
}

class _CreditCardSliderState extends State<CreditCardSlider> {
  int _currentIndex = 0;
  int indexMap = 0;

  List<dynamic> cardWidgets = [];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context, listen: false);
    cardWidgets = [];
    for (int i = 0; i < user.cards.length; i++) {
      cardWidgets.add(
        CreditCard(
          user.cards[i]['cardNumber'], 
          user.cards[i]['expDate'], 
          user.cards[i]['cardNumber'],  
          user.cards[i]['cardType'], 
          index: i,
        )
      );
    }

    return Column(
      children: <Widget>[
        CarouselSlider(
          options: CarouselOptions(
            height: 200.0,
            autoPlayCurve: Curves.fastOutSlowIn,
            pauseAutoPlayOnTouch: true,
            aspectRatio: 2.0,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          items: cardWidgets.map((card) {
            return Builder(builder: (BuildContext context) {
              return Container(
                height: MediaQuery.of(context).size.height * 0.30,
                width: MediaQuery.of(context).size.width,
                child: card,
              );
            }); 
          }).toList(),
        ),
        // dots
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: map<Widget>(cardWidgets, (index, url) {
            return Container(
              width: 10.0,
              height: 10.0,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == index
                    ? Colors.blueAccent
                    : Colors.grey,
              ),
            );
          }),
        ),
      ],
    );
  }
}
