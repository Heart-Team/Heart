import 'package:flutter/material.dart';
import 'package:heart_app/Providers/Filter.dart';
import 'package:heart_app/Providers/Survey.dart';
import 'package:heart_app/theme.dart';
import 'package:heart_app/widgets/home/DropdownButton.dart';
import 'package:heart_app/widgets/surveys/SurveyChip.dart';
import 'package:provider/provider.dart';

class FilterOptions extends StatefulWidget {
  @override
  _FilterOptionsState createState() => _FilterOptionsState();
}

class _FilterOptionsState extends State<FilterOptions> {

  final categoryNames = [
    'Human Services',
    'Education',
    'International',
    'Human and Civil Rights',
    'Religion',
    'Animals',
    'Arts, Culture, Humanities',
    'Health',
    'Community Development',
    'Environment',
    'Research and Public Policy',
  ];
  final states = [
    {'name': 'All States', 'value': ''},
    {'name':'ALABAMA', 'value':'AL'},
    {'name':'ALASKA', 'value':'AK'},
    {'name':'AMERICAN SAMOA', 'value':'AS'},
    {'name':'ARIZONA', 'value':'AZ'},
    {'name':'ARKANSAS', 'value':'AR'},
    {'name':'CALIFORNIA', 'value':'CA'},
    {'name':'COLORADO', 'value':'CO'},
    {'name':'CONNECTICUT', 'value':'CT'},
    {'name':'DELAWARE', 'value':'DE'},
    {'name':'DISTRICT OF COLUMBIA', 'value':'DC'},
    {'name':'FLORIDA', 'value':'FL'},
    {'name':'GEORGIA', 'value':'GA'},
    {'name':'GUAM', 'value':'GU'},
    {'name':'HAWAII', 'value':'HI'},
    {'name':'IDAHO', 'value':'ID'},
    {'name':'ILLINOIS', 'value':'IL'},
    {'name':'INDIANA', 'value':'IN'},
    {'name':'IOWA', 'value':'IA'},
    {'name':'KANSAS', 'value':'KS'},
    {'name':'KENTUCKY', 'value':'KY'},
    {'name':'LOUISIANA', 'value':'LA'},
    {'name':'MAINE', 'value':'ME'},
    {'name':'MARYLAND', 'value':'MD'},
    {'name':'MASSACHUSETTS', 'value':'MA'},
    {'name':'MICHIGAN', 'value':'MI'},
    {'name':'MINNESOTA', 'value':'MN'},
    {'name':'MISSISSIPPI', 'value':'MS'},
    {'name':'MISSOURI', 'value':'MO'},
    {'name':'MONTANA', 'value':'MT'},
    {'name':'NEBRASKA', 'value':'NE'},
    {'name':'NEVADA', 'value':'NV'},
    {'name':'NEW HAMPSHIRE', 'value':'NH'},
    {'name':'NEW JERSEY', 'value':'NJ'},
    {'name':'NEW MEXICO', 'value':'NM'},
    {'name':'NEW YORK', 'value':'NY'},
    {'name':'NORTH CAROLINA', 'value':'NC'},
    {'name':'NORTH DAKOTA', 'value':'ND'},
    {'name':'OHIO', 'value':'OH'},
    {'name':'OKLAHOMA', 'value':'OK'},
    {'name':'OREGON', 'value':'OR'},
    {'name':'PENNSYLVANIA', 'value':'PA'},
    {'name':'PUERTO RICO', 'value':'PR'},
    {'name':'RHODE ISLAND', 'value':'RI'},
    {'name':'SOUTH CAROLINA', 'value':'SC'},
    {'name':'SOUTH DAKOTA', 'value':'SD'},
    {'name':'TENNESSEE', 'value':'TN'},
    {'name':'TEXAS', 'value':'TX'},
    {'name':'UTAH', 'value':'UT'},
    {'name':'VERMONT', 'value':'VT'},
    {'name':'VIRGINIA', 'value':'VA'},
    {'name':'VIRGIN ISLANDS', 'value':'VI'},
    {'name':'WASHINGTON', 'value':'WA'},
    {'name':'WEST VIRGINIA', 'value':'WV'},
    {'name':'WISCONSIN', 'value':'WI'},
    {'name':'WYOMING', 'value':'WY'},
  ];
  final rating = [
    {'name': '1 Star', 'value': '1'},
    {'name': '2 Stars', 'value': '2'},
    {'name': '3 Stars', 'value': '3'},
    {'name': '4 Stars', 'value': '4'}
  ];
  Map<String, dynamic> _selectedFilters = {
    'categories': [],
    'taxExempt': true,
    'location': '',
    'rating': '1'
  };

  void updateSelectedFilters(String key, dynamic value){
    setState(() {
      if(key == 'categories'){
        if(_selectedFilters['categories'].contains(value))
          _selectedFilters['categories'].remove(value);
        else
          _selectedFilters['categories'].add(value);
      }
      else
        _selectedFilters[key] = value;

      print(_selectedFilters);
    });
  }

  @override
  Widget build(BuildContext context) {

    final filters = Provider.of<Filter>(context, listen: false);
    final survey = Provider.of<Survey>(context, listen: false);

    return Container(
      width: double.infinity,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Category Name',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: AppTheme().primaryColor,
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Wrap(
              runSpacing: 10,
              spacing: 8,
              children: categoryNames
                .map((e) => SurveyChip(e, isFilter: true, updateSelectedFilters: updateSelectedFilters))
                .toList(),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Tax Exempt',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: AppTheme().primaryColor,
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Switch.adaptive(
              value: _selectedFilters['taxExempt'],
              onChanged: (val) {
                updateSelectedFilters('taxExempt', val);
              }
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Location',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: AppTheme().primaryColor,
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            MyDropDown(
              'All states', 
              _selectedFilters['location'], 
              states,
              updateSelectedFilters, 
              objKey: 'location',
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Ratings',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: AppTheme().primaryColor,
                fontSize: 18,
              ),
            ),
            MyDropDown(
              'Minimum Rating', 
              _selectedFilters['rating'], 
              rating, 
              updateSelectedFilters, 
              objKey: 'rating',
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: TextButton(
                    child: Text(
                      'Apply',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(AppTheme().primaryColor),
                    ),
                    onPressed: (){
                      if(filters.searchResults.isEmpty)
                        survey.filterRecommendations(_selectedFilters, survey.recommendations);
                      else
                        filters.filterSearch(_selectedFilters, filters.searchResults);
                        
                      filters.setFiltering();
                      Navigator.of(context).pop();
                    }
                  ), 
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextButton(
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.grey[400]),
                    ),
                    onPressed: () => Navigator.of(context).pop()
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}