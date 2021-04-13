import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:heart_app/Providers/User.dart';
import 'package:heart_app/theme.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AddCardDialog extends StatefulWidget {
  @override
  _AddCardDialogState createState() => _AddCardDialogState();
}

class _AddCardDialogState extends State<AddCardDialog> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController _textEditingController;
  final info = {
    'fullName': '',
    'cardNumber': '',
    'expDate': '',
    'streetAddress': '',
    'apt': '',
    'city': '',
    'state': '',
    'zipCode': ''
  };

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override 
  void dispose() {
    super.dispose();
    _textEditingController.dispose();
  }

  void submit() async {
    final isValid = _formKey.currentState.validate();
    if(isValid){
      Provider.of<User>(context, listen: false).addCreditCard(
        info['fullName'],
        info['cardNumber'], 
        info['expDate'], 
        info['streetAddress'], 
        info['apt'], 
        info['city'], 
        info['state'], 
        info['zipCode']
      );
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15),
            TextFormField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person, color: Colors.grey),
                  errorMaxLines: 3,
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(style: BorderStyle.none)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[300], width: 0.8),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  disabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey[300], width: 0.8)),
                  focusColor: Colors.red,
                  hintText: "Cardholder Full Name",
                  hintStyle: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w600),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 13, horizontal: 10)
              ),
              validator: (value) {
                print(value.trim().split(' '));
                if(value.isEmpty || value.trim().split(' ').length == 1){
                  return "Please Enter Your Full Name";
                }
                return null;
              },
              onChanged: (val){
                info['fullName'] = val;
              },
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.credit_card, color: Colors.grey),
                  errorMaxLines: 3,
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(style: BorderStyle.none)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[300], width: 0.8),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  disabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey[300], width: 0.8)),
                  focusColor: Colors.red,
                  hintText: "Card Number",
                  hintStyle: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w600),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 13, horizontal: 10)
              ),
              validator: (value) {
                if(value.length != 16 || !['4','5','6'].contains(value[0])){
                  return "Please Enter A Valid Card Number";
                }
            
                return null;
              },
              onChanged: (val){
                info['cardNumber'] = val;
              },
            ),
            TextFormField(
              controller: _textEditingController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.date_range, color: Colors.grey), 
                  errorMaxLines: 3,
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(style: BorderStyle.none)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[300], width: 0.8),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  disabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey[300], width: 0.8)),
                  focusColor: Colors.red,
                  hintText: "MM / YYYY",
                  hintStyle: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w600),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 13, horizontal: 10)
              ),
              validator: (value) {
                try {
                  final expDate = DateFormat('MM/yyyy').parse(value);
                  final now = DateTime.now();
                  if(now.isAfter(expDate)){
                    return 'Please enter an unexpired card';
                  }
                } on FormatException {
                  return 'Please enter a valid date';
                }

                return null;
              },

              onChanged: (val){
                // if(val.length == 2){
                //   _textEditingController.value = TextEditingValue(
                //     selection: TextSelection.fromPosition(
                //       TextPosition(offset: 5),
                //     ),
                //   );
                // }
                // else{
                //   _textEditingController.text = val;
                // }
                info['expDate'] = _textEditingController.text;
              },
            ),
            SizedBox(height: 15),
            Text(
              'Billing Information',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              textAlign: TextAlign.left
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.add_location_alt, color: Colors.grey),
                  errorMaxLines: 3,
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(style: BorderStyle.none)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[300], width: 0.8),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  disabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey[300], width: 0.8)),
                  focusColor: Colors.red,
                  hintText: "Street Address",
                  hintStyle: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w600),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 13, horizontal: 10)
              ),
              validator: (value) {
                if(value.isEmpty){
                  return "Please enter a valid street adress";
                }
                
                return null;
              },
              onChanged: (val){
                info['streetAddress'] = val;
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.apartment, color: Colors.grey),
                  errorMaxLines: 3,
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(style: BorderStyle.none)
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[300], width: 0.8),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  disabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[300], width: 0.8)
                  ),
                  focusColor: Colors.red,
                  hintText: "Apt",
                  hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),
                  contentPadding: EdgeInsets.symmetric(vertical: 13, horizontal: 10)
              ),
              onChanged: (val){
                info['apt'] = val;
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.location_city, color: Colors.grey),
                  errorMaxLines: 3,
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(style: BorderStyle.none)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[300], width: 0.8),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  disabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey[300], width: 0.8)),
                  focusColor: Colors.red,
                  hintText: "City",
                  hintStyle: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w600),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 13, horizontal: 10)
              ),
              validator: (value) {
                if(value.isEmpty){
                  return "Please eneter a valid city";
                }
                return null;
              },
              onChanged: (val){
                info['city'] = val;
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.map, color: Colors.grey),
                  errorMaxLines: 3,
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(style: BorderStyle.none)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[300], width: 0.8),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  disabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey[300], width: 0.8)),
                  focusColor: Colors.red,
                  hintText: "State",
                  hintStyle: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w600),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 13, horizontal: 10)
              ),
              validator: (value) {
                if(value.length != 2){
                  return "Please enter your state in 2 letter format";
                }
                return null;
              },
              onChanged: (val){
                info['state'] = val;
              },
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.gps_fixed_sharp, color: Colors.grey),
                  errorMaxLines: 3,
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(style: BorderStyle.none)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[300], width: 0.8),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  disabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey[300], width: 0.8)),
                  focusColor: Colors.red,
                  hintText: "Zip Code",
                  hintStyle: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w600),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 13, horizontal: 10)
              ),
              validator: (value) {
                if(value.length != 5 || double.tryParse(value) == null){
                  return "Please enter a valid zip code";
                }
                return null;
              },
              onChanged: (val){
                info['zipCode'] = val;
              },
            ),
            MaterialButton(
              color: AppTheme().primaryColor, 
              minWidth: double.infinity,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.symmetric(vertical: 8),
              elevation: 0,
              child: Text(
                'Submit',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white
                ),
              ),
              onPressed: submit
            )
          ],
        ),
      ),
    );
  }
}

// Make flush bar one resuable widget