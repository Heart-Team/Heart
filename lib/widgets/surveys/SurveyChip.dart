import 'package:flutter/material.dart';
import 'package:heart_app/theme.dart';

class SurveyChip extends StatefulWidget {
  @override
  _SurveyChipState createState() => _SurveyChipState();

  final String title;
  SurveyChip(this.title);
}

class _SurveyChipState extends State<SurveyChip> {

  var _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          _isSelected = !_isSelected;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        decoration: BoxDecoration(
          color: _isSelected ? AppTheme().primaryColor : Colors.white,
          boxShadow: [
            !_isSelected ? BoxShadow(
              color: Colors.black12.withOpacity(0.15),
              blurRadius: 10
            ) : BoxShadow(
              color: Colors.transparent,
            ),
          ],
          borderRadius: BorderRadius.circular(10)
        ),
        child: Text(
          widget.title,
          style: TextStyle(
            fontSize: 18,
            color: _isSelected ? Colors.white : Colors.black
          ),
        ),
      ),
    );
  }
}