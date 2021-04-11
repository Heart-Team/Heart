import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:heart_app/Providers/User.dart';
import 'package:heart_app/theme.dart';
import 'package:provider/provider.dart';

class ChangePasswordDialog extends StatefulWidget {
  @override
  _ChangePasswordDialogState createState() => _ChangePasswordDialogState();
}

class _ChangePasswordDialogState extends State<ChangePasswordDialog> {

  final _formKey = GlobalKey<FormState>();
  String newPassword;
  String newPassword2;

  void submit() async {
    final isValid = _formKey.currentState.validate();
    if(isValid){
      final res = await Provider.of<User>(context, listen: false).updatePassword(newPassword);
      print('before flushbar');
      Navigator.of(context).pop();
      Flushbar(
        messageText: Text(
          res == 'success' ? 'Password updated successfully' : 'Something went wrong updating your password, please try again later',
          style: TextStyle(color: Colors.white),
        ),
        borderRadius: 10,
        backgroundColor: res=='success' ? Colors.green : Colors.red,
        margin: EdgeInsets.all(10),
        duration: Duration(seconds: 3),
        icon: Icon(
          Icons.error_outline,
          color: Colors.white,
        ),
      ).show(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(height: 15),
            TextFormField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock, color: Colors.grey),
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
                  hintText: "New Password",
                  hintStyle: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w600),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 13, horizontal: 10)
              ),
              obscureText: true,
              validator: (value) {
                if(newPassword != newPassword2){
                  return "Passwords do not match";
                }
                else if (value.isEmpty || !RegExp("^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{6,}\$").hasMatch(value))
                  return "Password must be 6 Characters, have atleast 1 uppercase letter, 1 lowercase letter and 1 number";

                return null;
              },
              onChanged: (val){
                newPassword = val;
              },
            ),
            SizedBox(height: 15),
            TextFormField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock, color: Colors.grey),
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
                  hintText: "Reenter New Password",
                  hintStyle: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w600),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 13, horizontal: 10)
              ),
              obscureText: true,
              validator: (value) {
                if(newPassword != newPassword2){
                  return "Passwords do not match";
                }
                else if (value.isEmpty || !RegExp("^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{6,}\$").hasMatch(value))
                  return "Password must be 6 Characters, have atleast 1 uppercase letter, 1 lowercase letter and 1 number";

                return null;
              },
              onChanged: (val){
                newPassword2 = val;
              },
            ),
            SizedBox(height: 20),
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