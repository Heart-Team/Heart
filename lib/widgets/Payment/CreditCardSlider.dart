import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:heart_app/Providers/User.dart';
import 'package:provider/provider.dart';
import './CreditCard.dart';

class CreditCardSlider extends StatefulWidget {
  @override
  _CreditCardSliderState createState() => _CreditCardSliderState();

  final Function setActiveCard;

  CreditCardSlider(this.setActiveCard);
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
          user.cards[i]['cardInfo']['cardNumber'], 
          user.cards[i]['cardInfo']['expDate'], 
          user.cards[i]['cardInfo']['fullName'],  
          user.cards[i]['cardInfo']['type'], 
          index: i,
        )
      );
    }

    return user.cards.length > 0 ? Column(
      children: <Widget>[
        CarouselSlider(
          options: CarouselOptions(
            height: 225.0,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: false,
            pauseAutoPlayOnTouch: true,
            scrollPhysics: BouncingScrollPhysics(),
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
                widget.setActiveCard(user.getCardDetails(index));
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
      ],
    ) : Padding(
      padding: const EdgeInsets.all(24.0),
      child: Text(
          'You have no saved credit cards',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Colors.grey
          )
        ),
    );
  }
}
