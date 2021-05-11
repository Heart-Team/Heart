import 'package:flutter/material.dart';
import 'package:heart_app/theme.dart';
import 'package:heart_app/widgets/home/FilterOptions.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class FilterDialog extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Alert(
          context: context,
          title: 'Filters',
          buttons: [],
          content: FilterOptions(),
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
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 9),
        child: Icon(
          Icons.filter_alt_outlined,
          color: Colors.grey,
        ),
      ),
    );
  }
}