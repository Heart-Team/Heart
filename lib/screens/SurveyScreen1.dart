import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heart_app/Providers/Survey.dart';
import 'package:heart_app/screens/SurveyScreen2.dart';
import 'package:heart_app/screens/TabsScreen.dart';
import 'package:provider/provider.dart';
import '../theme.dart';
// widgets
import '../widgets/MainDrawer.dart';
import '../widgets/surveys/SurveyGridItem.dart';

class SurveyScreen extends StatelessWidget {
  static const routeName = '/survey';

  final categoryArray = [
    {
      'name': 'Human Services',
      'image': 'assets/images/categories/human_services.png'
    },
    {'name': 'Education', 'image': 'assets/images/categories/education.png'},
    {
      'name': 'International',
      'image': 'assets/images/categories/international.png'
    },
    {
      'name': 'Human and Civil Rights',
      'image': 'assets/images/categories/human_rights.png'
    },
    {'name': 'Religion', 'image': 'assets/images/categories/religion.png'},
    {'name': 'Animals', 'image': 'assets/images/categories/animals.png'},
    {
      'name': 'Arts, Culture, Humanities',
      'image': 'assets/images/categories/arts_culture.png'
    },
    {'name': 'Health', 'image': 'assets/images/categories/health.png'},
    {
      'name': 'Environment',
      'image': 'assets/images/categories/environment.png'
    },
    {
      'name': 'Community Development',
      'image': 'assets/images/categories/community.png'
    },
    {
      'name': 'Research and Public Policy',
      'image': 'assets/images/categories/research.png'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context);
    final productId = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
        backgroundColor: Colors.white,
        drawer: MainDrawer(),
        body: Stack(
          children: [
            Container(
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
                      productId == null ?
                      'Let\'s Make a Difference'
                      : 'Update Your Preferences',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 28),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      'Select 4 Categories...',
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
                        disabledColor: Colors.grey,
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
                        onPressed:
                            Provider.of<Survey>(context).relevantMacros.length == 4
                                ? () {
                                    Navigator.of(context)
                                        .pushNamed(SurveyScreen2.routeName);
                                  }
                                : null,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ],
                )
              ),
              Positioned(child: 
                IconButton(
                  icon: Icon(
                    Icons.keyboard_backspace,
                    size: 30,
                    color: AppTheme().primaryColor,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                    Provider.of<Survey>(context, listen: false).clear();
                  }   
                ),
                top: 35,
                left: 10
              )
          ],
        )
      );
  }
}
