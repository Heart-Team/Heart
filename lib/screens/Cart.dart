import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heart_app/screens/PaymentMethodScreen.dart';
import 'package:heart_app/theme.dart';
import 'package:heart_app/widgets/MainDrawer.dart';
import "package:heart_app/widgets/cart/EmptyCart.dart";
import "package:heart_app/widgets/cart/CartData.dart";
import 'package:provider/provider.dart';
import 'package:heart_app/Providers/Cart.dart' as CartProvider;
import 'package:stripe_payment/stripe_payment.dart';
// import "package:heart_app/bottomnav/BottomNavigation.dart";


class Cart extends StatefulWidget {

  static const routeName = '/cart';

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {

  @override
  void initState() {
    super.initState();
    final cartData = Provider.of<CartProvider.Cart>(context, listen: false);
    if(cartData.cartCharities.length == 0){
      cartData.getCharities();
    }
    StripePayment.setOptions(
      StripeOptions(
        publishableKey: 'pk_test_51IijcAClIzB3w4r9Ki73khklq1BBzeaFnhWc2rA4myzg4L541iSYEKivTAgHhzmCFnP1OH2YyYQcvVd2jLOs27ue00wF42a3ZO',
        androidPayMode: 'test',
      )
    );
  }

  @override
  Widget build(BuildContext context) {

    final cartData = Provider.of<CartProvider.Cart>(context);

    return Scaffold(
      backgroundColor: Color.fromRGBO(254, 254, 254, 1),
      extendBody: true,
      extendBodyBehindAppBar: true,
      drawer: MainDrawer(),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 39,
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                "Your Cart",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            cartData.cartCharities.isEmpty
                ? EmptyCart()
                : Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(left: 30),
                    child: Text(
                      '${cartData.cartCharities.length} items',
                      style: TextStyle(fontSize: 20, color: Colors.grey, fontWeight: FontWeight.w600),
                    ),
                  ),
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (ctx, index) {
                          final cart = cartData.cartCharities;
                          return CartData(
                            cart[index]['ein'],
                            cart[index]['title'],
                            cart[index]['amount'],
                            cart[index]['imageUrl'],
                            key: UniqueKey()
                          );
                        },
                        itemCount: cartData.cartCharities.length,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, bottom: 90),
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 7),
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
                          cartData.cartCharities.isEmpty ? Navigator.pushNamedAndRemoveUntil(
                            context, 
                            '/', 
                            (route) => false
                          ) : Navigator.of(context).push(
                            CupertinoPageRoute(builder: (_) => PayMethodScreen())
                          );
                        },
                        child: Text(
                          cartData.cartCharities.isEmpty ? "Go Now" : "Next",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
