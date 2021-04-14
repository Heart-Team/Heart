import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:heart_app/Providers/User.dart';
import 'package:heart_app/theme.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EditBillingDialog extends StatefulWidget {
  @override
  _EditBillingDialogState createState() => _EditBillingDialogState();
  
  final Map<String,dynamic> info;
  final Map<String,dynamic> cardInfo;
  final int index;
  EditBillingDialog(this.info, this.cardInfo, this.index);
}

class _EditBillingDialogState extends State<EditBillingDialog> {

  final _formKey = GlobalKey<FormState>();
  final editedBillingInfo = {
    'streetAddress': '',
    'apt': '',
    'city': '',
    'state': '',
    'zipCode': ''
  };

  void submit() async {
    final isValid = _formKey.currentState.validate();
    if(isValid){
      Provider.of<User>(context, listen: false).updateCard(
        widget.cardInfo['fullName'], 
        Provider.of<User>(context, listen: false).decrypt(widget.cardInfo['cardNumber']),
        widget.cardInfo['expDate'], 
        widget.info['streetAddress'], 
        widget.info['apt'], 
        widget.info['city'], 
        widget.info['state'], 
        widget.info['zipCode'], 
        widget.index
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
              initialValue: widget.info['streetAddress'],
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.add_location_alt, color: Colors.grey),
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
                hintText: "Street Address",
                hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),
                contentPadding: EdgeInsets.symmetric(vertical: 13, horizontal: 10)
              ),
              validator: (value) {
                if(value.isEmpty){
                  return "Please enter a valid street adress";
                }
                return null;
              },
              onChanged: (val){
                editedBillingInfo['streetAddress'] = val;
              },
            ),
            TextFormField(
              initialValue: widget.info['apt'],
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
                editedBillingInfo['apt'] = val;
              },
            ),
            TextFormField(
              initialValue: widget.info['city'],
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
                  borderSide: BorderSide(color: Colors.grey[300], width: 0.8)),
                  focusColor: Colors.red,
                  hintText: "City",
                  hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),
                  contentPadding: EdgeInsets.symmetric(vertical: 13, horizontal: 10)
              ),
              validator: (value) {
                if(value.isEmpty){
                  return "Please enter a valid city";
                }
                return null;
              },
              onChanged: (val){
                editedBillingInfo['city'] = val;
              },
            ),
            TextFormField(
              initialValue: widget.info['state'],
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
                editedBillingInfo['state'] = val;
              },
            ),
            TextFormField(
              initialValue: widget.info['zipCode'],
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
                editedBillingInfo['zipCode'] = val;
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