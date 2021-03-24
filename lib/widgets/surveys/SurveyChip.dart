import 'package:flutter/material.dart';
import 'package:heart_app/Providers/User.dart';
import 'package:heart_app/theme.dart';
import 'package:provider/provider.dart';

class SurveyChip extends StatefulWidget {
  @override
  _SurveyChipState createState() => _SurveyChipState();

  final String title;
  final String category;
  SurveyChip(this.title, {this.category});
}

class _SurveyChipState extends State<SurveyChip> {
  var _isSelected = false;
  var user;

  @override
  void initState() {
    super.initState();
    user = Provider.of<User>(context, listen: false);
  }

  void onTap() {
    print(user.totalMicrosSelected);
    setState(() {
      if (user.totalMicrosSelected < 8 && !_isSelected) {
        _isSelected = true;
        if (_isSelected) {
          user.addMicro(widget.category, widget.title);
        } 
      }
      else {
        if(_isSelected){
          user.removeMicro(widget.category, widget.title);
        }
        _isSelected = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        decoration: BoxDecoration(
            color: _isSelected ? AppTheme().primaryColor : Colors.white,
            boxShadow: [
              !_isSelected
                  ? BoxShadow(
                      color: Colors.black12.withOpacity(0.15), blurRadius: 10)
                  : BoxShadow(
                      color: Colors.transparent,
                    ),
            ],
            borderRadius: BorderRadius.circular(10)),
        child: Text(
          widget.title,
          style: TextStyle(
              fontSize: 18, color: _isSelected ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
