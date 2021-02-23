import 'package:flutter/material.dart';
import 'package:heart_app/theme.dart';

class ChangePasswordDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Form(
        child: Column(
          children: [
            SizedBox(height: 15),
            TextFormField(
              decoration: InputDecoration(
                  prefixIcon:
                      Icon(Icons.lock, color: Colors.grey),
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
                  hintText: "Old Password",
                  hintStyle: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w600),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 13, horizontal: 10)),
            ),
            SizedBox(height: 15),
            TextFormField(
              decoration: InputDecoration(
                  prefixIcon:
                      Icon(Icons.lock, color: Colors.grey),
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
                      EdgeInsets.symmetric(vertical: 13, horizontal: 10)),
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
              onPressed: (){
                Navigator.of(context).pop();
              }
            )
          ],
        ),
      ),
    );
  }
}
