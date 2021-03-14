import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heart_app/Providers/User.dart';
import 'package:heart_app/screens/TabsScreen.dart';
import 'package:heart_app/theme.dart';
import 'package:heart_app/widgets/MainDrawer.dart';
import 'package:heart_app/widgets/surveys/SurveyChip.dart';
import 'package:provider/provider.dart';

class SurveyScreen2 extends StatelessWidget {

  static const routeName = '/survey2';

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context);

    final microCategories = [
      {
        'name': 'Homeless Services'
      },
      {
        'name': 'Food Banks'
      },
      {
        'name': 'Rescue Missions'
      },
      {
        'name': 'Animal rights'
      },
      {
        'name': 'Family Aid'
      },
      {
        'name': 'Homeless Services'
      },
      {
        'name': 'Scholarship & Financial Support'
      },
      {
        'name': 'Special Education'
      },
      {
        'name': 'Zoos and Aquariums'
      },
      {
        'name': 'Youth Development and shelter'
      },
      {
        'name': 'Other'
      },
      {
        'name': 'Other'
      },
      {
        'name': 'Other'
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      drawer: MainDrawer(),
      body: Container(
        margin: EdgeInsets.only(top: deviceSize.padding.top + 15, left: 15, right: 15, bottom: 20),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                child: Icon(
                  Icons.keyboard_backspace,
                  color: AppTheme().primaryColor,
                  size: 30,
                ), 
                onTap: (){
                  Navigator.of(context).pop();
                }
              ),
            ),
            SizedBox(height: 7), 
            Text(
              'Lets Go Deeper, what interests you',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w600
              ),
              textAlign: TextAlign.center, 
            ),
            SizedBox(height: 8),
            Text(
              'Select up to 8...',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: 
                  Container(
                    margin: EdgeInsets.fromLTRB(10,15,10,10),
                    child: Wrap(
                      runSpacing: 18,
                      spacing: 15, 
                      children: microCategories.map((e) => SurveyChip(e['name'])).toList()
                    ),
                  )
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: MaterialButton(
                color: AppTheme().primaryColor,
                minWidth: 175,
                splashColor: Colors.red[200],
                elevation: 0,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical:5,
                  ),
                  child: Text(
                    "Next",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                onPressed: () async {
                  Navigator.of(context).pushNamed(TabScreen.routeName);
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}