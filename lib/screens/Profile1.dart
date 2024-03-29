import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heart_app/Providers/Auth.dart';
import 'package:heart_app/Providers/Charity.dart';
import 'package:heart_app/Providers/Suggestions.dart';
import 'package:heart_app/Providers/User.dart';
import 'package:heart_app/widgets/home/OrganizationTile.dart';
import 'package:heart_app/widgets/profile/Header.dart';
import 'package:heart_app/widgets/profile/SavedCharitiesTile.dart';
import 'package:heart_app/widgets/utilities/Loading.dart';
import 'package:provider/provider.dart';
import '../theme.dart';

class Profile extends StatefulWidget {
  static const routeName = '/profile';

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile>{

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final user = Provider.of<User>(context,listen: false);
    final folders = user.getDistinctFavoriteCategories();

    return Scaffold(
        backgroundColor: Colors.white,
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
                        child: folders.length > 0 ? ListView(
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          children: folders
                              .map((e) => SavedCharitiesTile(
                                    e,
                                  ))
                              .toList(),
                        ) : Center(child: Text(
                          'No Saved Charities',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                            fontSize: 20
                          )
                        )),
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
                      child: FutureBuilder(
                        future: Provider.of<Suggestions>(context, listen: false).userSuggestions(),
                        builder: (_, snapshot) {
                          if(snapshot.connectionState == ConnectionState.waiting){
                            return Loading();
                          }
                          else{
                            final suggestions = Provider.of<Suggestions>(context, listen: false).suggestions;
                            return ListView.builder(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              physics: BouncingScrollPhysics(),
                              itemBuilder: (ctx, index) => OrganizationTile(
                                suggestions[index]['charityName'],
                                suggestions[index]['categoryName'],
                                suggestions[index]['imageURL'],
                                suggestions[index]['ein'],
                              ),
                              itemCount: suggestions.length,
                            );
                          }
                        },
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
