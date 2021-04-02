import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heart_app/Providers/Cart.dart';
import 'package:heart_app/screens/Sucess.dart';
import 'package:heart_app/widgets/MainDrawer.dart';
import 'package:heart_app/widgets/Payment/CartList.dart';
import 'package:heart_app/theme.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import '../widgets/CreditCard.dart';

class PaymethodScreen extends StatefulWidget {
  static const routeName = '/paymentmethod';

  @override
  _PaymethodScreenState createState() => _PaymethodScreenState();
}

class _PaymethodScreenState extends State<PaymethodScreen> {
  int _currentIndex = 0;
  int indexMap = 0;

  final creditCards = [
    {
      'cardNumber': '1234 1234 1234 1234',
      'expDate': '12/2022',
      'cardType': 'visa'
    },
    {
      'cardNumber': '1234 1234 1234 1234',
      'expDate': '12/2022',
      'cardType': 'mastercard'
    },
    {
      'cardNumber': '1234 1234 1234 1234',
      'expDate': '12/2022',
      'cardType': 'mastercard'
    },
  ];

  List cardWidgets = [];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {

    final cartProvider = Provider.of<Cart>(context, listen: false);

    cardWidgets = [];
    for (int i = 0; i < creditCards.length; i++) {
      cardWidgets.add(CreditCard(
          creditCards[i]['cardNumber'], creditCards[i]['expDate'], [i, i + 1]));
    }


    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      extendBodyBehindAppBar: true,
      drawer: MainDrawer(),
      body: Container(
          child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 40, bottom: 25),
            alignment: Alignment.center,
            child: Text(
              "Payment Method",
              style: TextStyle(fontSize: 25),
            ),
          ),
          Column(
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
          ),
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemBuilder: (ctx, index) {
                final cart = cartProvider.cartCharities;
                return CartList(
                  cart[index]['title'],
                  cart[index]['amount'],
                );
              },
              itemCount: cartProvider.cartCharities.length,
            ),
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
              padding: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12.withOpacity(0.15), blurRadius: 15)
                  ]),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Total",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      Text("\$${cartProvider.totalSum.toStringAsFixed(2)}", style: TextStyle(fontSize: 20))
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 7),
                    decoration: BoxDecoration(
                      color: AppTheme().primaryColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12.withOpacity(0.25),
                            blurRadius: 20)
                      ],
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context, 
                          CupertinoPageRoute(builder: (_) => Suc())
                        );
                      },
                      child: Text(
                        "Checkout",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ))
        ],
      )),
    );
  }
}
