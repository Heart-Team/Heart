import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heart_app/screens/SurveyScreen2.dart';
import '../theme.dart';
// widgets
import '../widgets/MainDrawer.dart';
import '../widgets/surveys/SurveyGridItem.dart';

class SurveyScreen extends StatelessWidget {
  static const routeName = '/survey';

  final categoryArray = [
    {'name': 'Environment', 'image': 'assets/images/environment.png'},
    {'name': 'Animals', 'image': 'assets/images/animals.png'},
    {'name': 'Arts & Culture', 'image': 'assets/images/arts_culture.png'},
    {'name': 'Health', 'image': 'assets/images/health.png'},
    {'name': 'Education', 'image': 'assets/images/education.png'},
    {'name': 'Human Services', 'image': 'assets/images/human_services.png'},
    {'name': 'Test Category', 'image': 'assets/images/environment.png'},
    {'name': 'Another One', 'image': 'assets/images/environment.png'},
  ];

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context);
    return Scaffold(
        backgroundColor: Colors.white,
        drawer: MainDrawer(),
        body: Container(
            width: double.infinity,
            padding: EdgeInsets.only(
                top: deviceSize.padding.top + 15,
                left: 20,
                right: 20,
                bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Let\'s Make a Difference',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 28),
                ),
                SizedBox(
                  height: 7,
                ),
                Text(
                  'Select Up To 4...',
                  style: TextStyle(fontSize: 18),
                ),
                Container(
                  // margin: EdgeInsets.only(bottom: 10),
                  child: Expanded(
                    child: GridView(
                      physics: BouncingScrollPhysics(),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1 / 1,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15),
                      children: categoryArray
                          .map((e) => SurveyGridItem(e['name'], e['image']))
                          .toList(),
                    ),
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
                        vertical: 5,
                      ),
                      child: Text(
                        "Next",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(CupertinoPageRoute(
                          builder: (ctx) => SurveyScreen2()));
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ],
            )));
  }
}
