import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heart_app/Providers/Survey.dart';
import 'package:heart_app/screens/TabsScreen.dart';
import 'package:heart_app/theme.dart';
import 'package:heart_app/widgets/MainDrawer.dart';
import 'package:heart_app/widgets/surveys/SurveyChip.dart';
import 'package:provider/provider.dart';

class SurveyScreen2 extends StatelessWidget {
  static const routeName = '/survey2';
  // List<dynamic> microCategories = [];
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context);
    final user = Provider.of<Survey>(context);

    return Scaffold(
        backgroundColor: Colors.white,
        drawer: MainDrawer(),
        body: FutureBuilder(
          future: Provider.of<Survey>(context).getMicroCategories(),
          builder: (ctx, snapshot) => Container(
            margin: EdgeInsets.only(
                top: deviceSize.padding.top + 15,
                left: 15,
                right: 15,
                bottom: 20),
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
                      onTap: () {
                        Navigator.of(context).pop();
                      }),
                ),
                SizedBox(height: 7),
                Text(
                  'Lets Go Deeper, what interests you',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
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
                      child: Container(
                        margin: EdgeInsets.fromLTRB(10, 15, 10, 10),
                        child: Wrap(
                            runSpacing: 18,
                            spacing: 15,
                            children: user.relevantMicros.map((e) {
                              return SurveyChip(e['causeName'],
                                  category: e['category'], isFilter: false,);
                            }).toList()),
                      )),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  child: MaterialButton(
                    color: AppTheme().primaryColor,
                    minWidth: 175,
                    disabledColor: Colors.grey,
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
                    onPressed: user.totalMicrosSelected == 8
                        ? () async {
                            await user.updateSurveyResults();
                            // await Provider.of<Survey>(context, listen: false)
                            //     .homeRecommendations();
                            Navigator.of(context)
                                .popAndPushNamed(TabScreen.routeName);
                          }
                        : null,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
