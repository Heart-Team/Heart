import 'package:flutter/material.dart';

class MyDropDown extends StatelessWidget {

  final String hint;
  final String value;
  final List<dynamic> items;
  final Function updateSelectedFilters;
  final String objKey;

  MyDropDown(this.hint, this.value, this.items, this.updateSelectedFilters, this.objKey);

  @override
  Widget build(BuildContext context) {
    return DropdownButton<dynamic>(
      hint: Text(hint),
      value: value,
      items: items
        .map((e) => DropdownMenuItem(
          value: e['value'],
          child: Text(e['name']),
        )
      ).toList(),
      onChanged: (val) => updateSelectedFilters(objKey, val)
    );
  }
}