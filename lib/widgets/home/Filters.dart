import 'package:flutter/material.dart';
import 'package:heart_app/theme.dart';
import 'package:heart_app/widgets/home/DropdownButton.dart';
import 'package:heart_app/widgets/home/FilterDialog.dart';
import 'package:heart_app/widgets/surveys/SurveyChip.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Filters extends StatefulWidget {
  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   _selectedFilters = {
  //     'categories': [],
  //     'taxExempt': true,
  //     'location': 'All states',
  //     'rating': '1'
  //   };
  //   print('initializing state');
  // }

  void sortCharitiesByNames() {
    // setState(() {
    //   charities
    //       .sort((a, b) => a['name'].toString().compareTo(b['name'].toString()));
    // });
  }

  void sortCharitiesByCauses() {
    // setState(() {
    //   charities.sort((a, b) =>
    //       a['category'].toString().compareTo(b['category'].toString()));
    // });
  }

  @override
  Widget build(BuildContext context) {

    final device = MediaQuery.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FilterDialog(),
        Container(
          margin: EdgeInsets.only(right: 10),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: 'Sort By',
              elevation: 16,
              items: ['Sort By', 'Names', 'Causes']
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(
                          e,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ))
                  .toList(),
              onChanged: (value) {
                if (value == 'Names') {
                  //sort by names
                  sortCharitiesByNames();
                }
                if (value == 'Causes') {
                  //sort by causes
                  sortCharitiesByCauses();
                }
              },
            ),
          ),
        )
      ],
    );
  }
}