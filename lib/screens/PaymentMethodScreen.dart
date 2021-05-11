import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heart_app/Providers/Cart.dart';
import 'package:heart_app/Providers/MonthlyPayments.dart';
import 'package:heart_app/Providers/User.dart';
import 'package:heart_app/screens/Sucess.dart';
import 'package:heart_app/widgets/MainDrawer.dart';
import 'package:heart_app/widgets/Payment/CartList.dart';
import 'package:heart_app/theme.dart';
import 'package:heart_app/widgets/Payment/CreditCardSlider.dart';
import 'package:provider/provider.dart';

class PayMethodScreen extends StatelessWidget {

  static const routeName = '/payment-method';

  @override
  Widget build(BuildContext context) {

    final cartProvider = Provider.of<Cart>(context, listen: false);
    final monthlyPaymentProviders = Provider.of<MonthlyPayments>(context,listen: false);
    // final user = Provider.of<User>(context,listen: false);

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
          CreditCardSlider(),
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
                        // here collect all the checkout data and store to have monthly chart
                        final cartData =  cartProvider.cartCharities;
                        for (var eachCartItem in cartData){
                          final title = eachCartItem["title"];
                          final amount = eachCartItem["amount"];
                          monthlyPaymentProviders.storePayments( {'charity':title,'amount':amount});
                        }

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
