import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heart_app/Providers/Auth.dart';
import 'package:heart_app/Providers/User.dart';
import 'package:heart_app/screens/AuthScreen.dart';
import 'package:heart_app/screens/UserDetailsScreen.dart';
import 'package:heart_app/widgets/MainDrawer.dart';
import 'package:heart_app/widgets/home/OrganizationTile.dart';
import 'package:heart_app/widgets/profile/Header.dart';
import 'package:heart_app/widgets/profile/SavedCharitiesTile.dart';
import 'package:provider/provider.dart';
import '../theme.dart';

class Profile extends StatelessWidget {
  static const routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    final savedCharities = [
      'Animal Charities',
      'Domestic Violence',
      'Environmental',
      'Children',
      'Technology'
    ];

    final charities = [
      {
        'name': 'Animals Charity',
        'category': 'Humanitarian Work',
        'image':
            'https://ichef.bbci.co.uk/news/1024/cpsprodpb/151AB/production/_111434468_gettyimages-1143489763.jpg'
      },
      {
        'name': 'Childrens Charity',
        'category': 'Social work',
        'image':
            'https://miro.medium.com/max/11326/1*6vDpSiK73AwHk6kG47ZrqQ.jpeg'
      },
      {
        'name': 'Cancer Awareness',
        'category': 'Research',
        'image':
            'https://www.nfcr.org/wp-content/uploads/2020/03/Cancer-research-is-t-worth-your-dime.jpg'
      },
      {
        'name': 'Veteran Support',
        'category': 'Social Work',
        'image':
            'https://nvf.org/wp-content/uploads/2016/07/veteran-support.jpg'
      },
      {
        'name': 'Charity Support',
        'category': 'Social Work',
        'image':
            'https://nvf.org/wp-content/uploads/2016/07/veteran-support.jpg'
      },
    ];

    return Scaffold(
        backgroundColor: Colors.white,
        drawer: MainDrawer(),
        body: Stack(
          children: [
            Positioned(
                child: Container(
                  height: deviceSize.height * 0.52,
                  width: deviceSize.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.elliptical(
                            deviceSize.width * 0.6, deviceSize.height * 0.25)),
                    color: AppTheme().primaryColor.withOpacity(0.3),
                  ),
                ),
                top: 0,
                left: 0),
            Positioned(
                child: Container(
                  height: deviceSize.height * 0.25,
                  width: deviceSize.width * 0.75,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.elliptical(120, 120)),
                    color: AppTheme().primaryColor.withOpacity(0.3),
                  ),
                ),
                bottom: 0,
                right: 0),
            Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.transparent,
              padding:
                  EdgeInsets.only(bottom: 55, left: 10, right: 10, top: 40),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Header(),
                    Container(
                      padding: EdgeInsets.only(left: 10, top: 0),
                      child: Text(
                        'Saved Charities',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      child: Expanded(
                        flex: 1,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          children: savedCharities
                              .map((e) => SavedCharitiesTile(
                                    e,
                                  ))
                              .toList(),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10, bottom: 20),
                      child: Text(
                        'Our Suggestions',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (ctx, index) => OrganizationTile(
                          charities[index]['name'],
                          charities[index]['category'],
                          charities[index]['image'],
                          '1231231231',
                        ),
                        itemCount: charities.length,
                      ),
                    ),
                  ]),
            ),
            Positioned(
                child: GestureDetector(
                    child: Column(
                      children: [
                        Icon(
                          Icons.logout,
                          size: 32,
                          color: AppTheme().primaryColor,
                        ),
                        Text(
                          'Logout',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    onTap: () async {
                      try {
                        await Provider.of<Auth>(context, listen: false)
                            .signout();
                        if (Provider.of<Auth>(context, listen: false)
                                .firstPage == 'surveyscreen')
                          Navigator.of(context).popAndPushNamed('/');
                        // Navigator.of(context).pop();
                      } catch (e) {
                        print(e);
                        Flushbar(
                          messageText: Text(
                            'Something went wrong logging out',
                            style: TextStyle(color: Colors.white),
                          ),
                          borderRadius: 10,
                          backgroundColor: Colors.red,
                          margin: EdgeInsets.all(10),
                          duration: Duration(seconds: 3),
                          icon: Icon(
                            Icons.error_outline,
                            color: Colors.white,
                          ),
                        ).show(context);
                      }
                    }),
                right: 20,
                top: MediaQuery.of(context).padding.top + 10),
          ],
        ));
  }
}
