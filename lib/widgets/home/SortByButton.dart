import 'package:flutter/material.dart';
import 'package:heart_app/widgets/home/DropdownButton.dart';

class SortByButton extends StatefulWidget {
  @override
  _SortByButtonState createState() => _SortByButtonState();
}

class _SortByButtonState extends State<SortByButton> {

  final value = {'sortBy': ''};
  final options = [
    {'name': 'Sort By', 'value': ''},
    {'name': 'Names', 'value': 'names'},
    {'name': 'Causes', 'value': 'causes'},
  ];

  void updateSortBy(String objKey, String val){
    setState(() {
      value[objKey] = val; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: DropdownButtonHideUnderline(
        child: MyDropDown(
          'Sort By', 
          value['sortBy'], 
          options,
          updateSortBy,
          objKey: 'sortBy',
        ),
      ),
    ); 
  }
}