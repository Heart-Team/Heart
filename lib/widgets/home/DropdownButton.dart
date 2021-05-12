import 'package:flutter/material.dart';
import 'package:heart_app/Providers/Filter.dart';
import 'package:heart_app/Providers/Survey.dart';
import 'package:provider/provider.dart';

class MyDropDown extends StatelessWidget {

  final String hint;
  final String value;
  final List<dynamic> items;
  final Function updateSelectedFilters;
  final String objKey;
  final bool isSort;

  MyDropDown(this.hint, this.value, this.items, this.updateSelectedFilters, {this.objKey, this.isSort});

  @override
  Widget build(BuildContext context) {
    return DropdownButton<dynamic>(
      hint: Text(hint),
      style: TextStyle(
        fontWeight: FontWeight.w600,
        color: Colors.grey[600],
        fontSize: 16,
        fontFamily: 'Poppins'
      ),
      value: value,
      items: items
        .map((e) => DropdownMenuItem(
          value: e['value'],
          child: Text(e['name']),
        )
      ).toList(),
      onChanged: (val) {
        updateSelectedFilters(objKey, val);
        if(isSort != null && isSort){
          final filter = Provider.of<Filter>(context, listen: false);
          final survey = Provider.of<Survey>(context, listen: false);
          if(filter.searchText.isEmpty){
            if(val.isEmpty){
              survey.reset();
            }
            else{
              survey.sortRecommendations(val, survey.recommendations);
            }
          }
          else{
            if(val.isEmpty){
              filter.search(filter.searchText);
            }
            else{
              filter.sortSearch(val, filter.searchResults);
            }
          }
        } 
      }
    );
  }
}