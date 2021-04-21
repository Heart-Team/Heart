import 'package:firebase_auth/firebase_auth.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:heart_app/Providers/Auth.dart';
import 'package:heart_app/theme.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  final _formKey = GlobalKey<FormState>();
  String email =  '';

  void submit() async {
    final isValid = _formKey.currentState.validate();
    if(isValid){
      _formKey.currentState.save();
      final res = await Provider.of<Auth>(context, listen: false).resetPassword(email, context);
      Flushbar(
        messageText: Text(
          res,
          style: TextStyle(color: Colors.white),
        ),
        borderRadius: 10,
        backgroundColor: res[0] == 'R' ? Colors.green : Colors.red, // LOLL
        margin: EdgeInsets.all(10),
        duration: Duration(seconds: 3),
        icon: Icon(
          Icons.error_outline,
          color: Colors.white,
        ),
      ).show(context);
    }
  }

  void showAlert() {
    Alert(
      context: context,
      title: 'Reset Password',
      buttons: [
        DialogButton(
          child: Text(
            "Submit",
            style:
                TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: (){
            submit();
            Navigator.of(context).pop();
          },
          color: AppTheme().primaryColor,
          radius: BorderRadius.circular(10.0),
        ),
      ],
      content: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        child: Form(
          key: _formKey,
          child: TextFormField(
            cursorColor: AppTheme().primaryColor,
            style: TextStyle(
              fontSize: 18
            ),
            decoration: InputDecoration(
                prefixIcon: Icon(
                    Icons.email,
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
                hintText: "Email",
                hintStyle: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                    fontSize: 18
                  ),
                contentPadding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 10
                  )
            ),
            onChanged: (val){
              email = val;
            },
            validator: (value) {
              if (value.isEmpty ||
                  !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value)) {
                return "Please enter a valid email address";
              }
              return null;
            },
          ),
        ),
      ),
      style: AlertStyle(
      animationType: AnimationType.grow,
      backgroundColor: Colors.white.withOpacity(0.85),
      overlayColor: Colors.black12.withOpacity(0.8),
      titleStyle: TextStyle(
          color: Colors.black87,
          fontSize: 26,
          fontWeight: FontWeight.w600),
      )
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Text(                
        'Forgot Password?',
        style: TextStyle(
          color: AppTheme().primaryColor,
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
        textAlign: TextAlign.end,
      ),
      onTap: () => showAlert(),
    );
  }
}