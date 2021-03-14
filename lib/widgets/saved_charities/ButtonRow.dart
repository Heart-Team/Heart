import 'package:flutter/material.dart';
import 'package:heart_app/theme.dart';

class ButtonRow extends StatefulWidget {
  @override
  _ButtonRowState createState() => _ButtonRowState();
}

class _ButtonRowState extends State<ButtonRow> {

  var _allSelected = true; 

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 25),
        GestureDetector(
          child: Container(
            child: Text('All',
              style: TextStyle(
                fontSize: 16,
                color: _allSelected ? Colors.white : Colors.black
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 8),
            decoration: BoxDecoration(
              color: _allSelected ? AppTheme().primaryColor : Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12.withOpacity(0.1),
                  blurRadius: 15
                )
              ],
              borderRadius: BorderRadius.circular(10)
            ),
          ),
          onTap: (){
            setState(() {
              _allSelected = true;
            });
          },
        ),
        SizedBox(width: 15),
        GestureDetector(
          child: Container(
            child: Text('Recently Added',
              style: TextStyle(
                color: _allSelected ? Colors.black : Colors.white,
                fontSize: 16
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 8),
            decoration: BoxDecoration(
              color: _allSelected ? Colors.white : AppTheme().primaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12.withOpacity(0.1),
                  blurRadius: 15
                )
              ],
              borderRadius: BorderRadius.circular(10)
            ),
          ),
          onTap: (){
            setState(() {
              _allSelected = false;
            });
          },
        )
      ],
    );
  }
}