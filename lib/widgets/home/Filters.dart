import 'package:flutter/material.dart';
import 'package:heart_app/theme.dart';
import 'package:heart_app/widgets/surveys/SurveyChip.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Filters extends StatefulWidget {
  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {

  final categoryNames = [
    {'name': 'Human Services'},
    {'name': 'Education'},
    {'name': 'International'},
    {'name': 'Human and Civil Rights'},
    {'name': 'Religion'},
    {'name': 'Animals'},
    {'name': 'Arts, Culture, Humanities'},
    {'name': 'Health'},
    {'name': 'Community Development'},
    {'name': 'Environment'},
    {'name': 'Research and Public Policy'},
  ];
  final states = [
    'Alabama',
    'Alaska',
    'American Samoa',
    'Arizona',
    'Arkansas',
    'California',
    'Colorado',
    'Connecticut',
    'Delaware',
    'District of Columbia',
    'Federated States of Micronesia',
    'Florida',
    'Georgia',
    'Guam',
    'Hawaii',
    'Idaho',
    'Illinois',
    'Indiana',
    'Iowa',
    'Kansas',
    'Kentucky',
    'Louisiana',
    'Maine',
    'Marshall Islands',
    'Maryland',
    'Massachusetts',
    'Michigan',
    'Minnesota',
    'Mississippi',
    'Missouri',
    'Montana',
    'Nebraska',
    'Nevada',
    'New Hampshire',
    'New Jersey',
    'New Mexico',
    'New York',
    'North Carolina',
    'North Dakota',
    'Northern Mariana Islands',
    'Ohio',
    'Oklahoma',
    'Oregon',
    'Palau',
    'Pennsylvania',
    'Puerto Rico',
    'Rhode Island',
    'South Carolina',
    'South Dakota',
    'Tennessee',
    'Texas',
    'Utah',
    'Vermont',
    'Virgin Island',
    'Virginia',
    'Washington',
    'West Virginia',
    'Wisconsin',
    'Wyoming'
  ];
  final ratings = [
    Icon(Icons.star),
    Icon(Icons.star),
    Icon(Icons.star),
    Icon(Icons.star),
    Icon(Icons.star),
  ];
  bool taxExempt = false;

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
        GestureDetector(
          onTap: () {
            Alert(
                context: context,
                title: 'Filters',
                buttons: [
                  DialogButton(
                    child: Text(
                      "Apply",
                      style:
                          TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onPressed: () => Navigator.pop(context),
                    color: AppTheme().primaryColor,
                    radius: BorderRadius.circular(10.0),
                  ),
                  DialogButton(
                    child: Text(
                      "Cancel",
                      style:
                          TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onPressed: () => Navigator.pop(context),
                    color: Colors.grey,
                    radius: BorderRadius.circular(10.0),
                  ),
                ],
                content: Container(
                  height: device.size.height * 0.55,
                  width: double.infinity,
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Cause Name',
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
                              .map((e) => SurveyChip(e['name']))
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
                            value: taxExempt,
                            onChanged: (val) {
                              taxExempt = val;
                            }),
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
                        DropdownButton<String>(
                            value: states[0],
                            items: states
                                .map((e) => DropdownMenuItem(
                                      value: e,
                                      child: Text(e),
                                    ))
                                .toList(),
                            onChanged: (val) {}),
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
                        DropdownButton<String>(
                            value: '1 star',
                            items: [
                              '1 star',
                              '2 star',
                              '3 star',
                              '4 star',
                              '5 star'
                            ]
                                .map((e) => DropdownMenuItem(
                                      value: e,
                                      child: Text(e),
                                    ))
                                .toList(),
                            onChanged: (val) {}),
                      ],
                    ),
                  ),
                ),
                style: AlertStyle(
                  animationType: AnimationType.grow,
                  backgroundColor: Colors.white.withOpacity(0.85),
                  overlayColor: Colors.black12.withOpacity(0.8),
                  titleStyle: TextStyle(
                      color: Colors.black87,
                      fontSize: 26,
                      fontWeight: FontWeight.w600),
                )).show();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 6.0, horizontal: 9),
            child: Icon(
              Icons.filter_alt_outlined,
              color: Colors.grey,
            ),
          ),
        ),
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