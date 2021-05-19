import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heart_app/Providers/Cart.dart';
import 'package:heart_app/Providers/MonthlyPayments.dart';
import 'package:heart_app/Providers/User.dart';
import 'package:heart_app/screens/Sucess.dart';
import 'package:heart_app/theme.dart';
import 'package:provider/provider.dart';

class CheckoutForm extends StatefulWidget {
  @override
  _CheckoutFormState createState() => _CheckoutFormState();

  final String amount;
  final String cardNumber;
  final String email;
  final String expDate;
  final String fullName;

  CheckoutForm({
    this.amount,
    this.cardNumber,
    this.email,
    this.expDate,
    this.fullName,
  });
}

class _CheckoutFormState extends State<CheckoutForm> {

  bool loading = false;
  String cvc;
  String description = "Donations made to";
  final _formKey = GlobalKey<FormState>();

  void submit() async {
    final monthlyPaymentProviders = Provider.of<MonthlyPayments>(context,listen: false);
    final cartProvider = Provider.of<Cart>(context, listen: false);
    final isValid = _formKey.currentState.validate();
    if(isValid){
      for (var eachCartItem in cartProvider.cartCharities){
        final title = eachCartItem["title"];
        final amount = eachCartItem["amount"];
        description += ', [${eachCartItem["title"]}: \$${eachCartItem["amount"]}]';
        await monthlyPaymentProviders.storePayments( {'charity':title,'amount':amount});
        await cartProvider.clearCart();
      }
      checkout();
    }
  }

  void checkout() async {
    setState(() {
      loading = true;
    });
    try {
      await Provider.of<User>(context, listen: false).processPayment(
        amount: widget.amount,
        cardNumber: widget.cardNumber,
        email: widget.email,
        description: description,
        expDate: widget.expDate,
        fullName: widget.fullName,
        cvc: cvc, 
        context: context
      );
      setState(() {
        loading = false;
      });
      Navigator.pushReplacement(
        context, 
        CupertinoPageRoute(builder: (_) => Suc())
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {    
    return Column(
      children: [
        Form(      
        key: _formKey,                
        child: TextFormField(
          cursorColor: AppTheme().primaryColor,
          keyboardType: TextInputType.number,
          maxLength: 3,
          style: TextStyle(
            fontSize: 22
          ),
          decoration: InputDecoration(
              prefixIcon: Icon(
                  Icons.security,
                  color: AppTheme().primaryColor,
              ),
              filled: true,
              fillColor: Colors.white,

              focusedBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(10),
                  borderSide: BorderSide(
                      style: BorderStyle.none)),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.grey[300],
                    width: 0.8), 
                borderRadius:
                    BorderRadius.circular(10),
              ),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(10),
                  borderSide: BorderSide(
                    width: 2,
                    color: Colors.red
                  )),
              errorBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(10),
                  borderSide: BorderSide(
                    width: 2,
                    color: Colors.red
                  )),
              disabledBorder:
                  UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.grey[300],
                          width: 0.8)),
              focusColor: Colors.red,
              hintText: "123",
              hintStyle: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                  fontSize: 22
                ),
              contentPadding: EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 10
                )
          ),
          onChanged: (val){
            cvc = val;
          },
          validator: (value) {
            if (value.isEmpty)
              return "Please Enter A Valid CVC";
            return null;
          },
        ),
        ),
        SizedBox(height: 25),
        Row(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 15),
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
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
                        onTap: () async {
                          // here collect all the checkout data and store to have monthly chart
                          submit();
                        },
                        child: loading ? Center(
                          child: SizedBox(
                            height: 20,
                            width: 20,
                            child: Container(
                              height: 20,
                              width: 20,
                              constraints: BoxConstraints(
                                maxHeight: 20,
                                maxWidth: 20,
                              ),
                              child: CircularProgressIndicator(
                                backgroundColor: AppTheme().primaryColor,
                              )
                            ),
                          ),
                        ) : Text(
                          'Checkout',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16
                          ),
                        ),
                      ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 15),
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12.withOpacity(0.25),
                              blurRadius: 20)
                          ],
                      ),
                      child: GestureDetector(
                        onTap: () async {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Cancel',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16
                          ),
                        ),
                      ),
              ),
            )
          ],
        )
      ],
    );
  }
}