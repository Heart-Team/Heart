import 'package:flutter/material.dart';
import 'package:heart_app/Providers/Search.dart';
import 'package:heart_app/Providers/Survey.dart';
import 'package:heart_app/theme.dart';
import 'package:heart_app/widgets/home/Filters.dart';
import 'package:heart_app/widgets/home/OrganizationList.dart';
import 'package:heart_app/widgets/home/OrganizationTile.dart';
import 'package:heart_app/widgets/surveys/SurveyChip.dart';
import 'package:heart_app/widgets/utilities/Loading.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
// widgets
import '../widgets/MainDrawer.dart';
import '../widgets/home/Searchbar.dart';
import '../Providers/User.dart';
import 'dart:collection';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final device = MediaQuery.of(context);
    return Scaffold(
      drawer: MainDrawer(),
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.fromLTRB(20, device.padding.top + 15, 20, 20),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 5),
                Expanded(
                  child: Container(
                    // padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      'Find your charities here',
                      softWrap: true,
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                Container(
                  // padding: EdgeInsets.symmetric(horizontal: 15),
                  height: 80,
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: Colors.black12.withOpacity(0.25), blurRadius: 15)
                  ], shape: BoxShape.circle),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image.network(
                        'https://cdn.chv.me/images/thumbnails/Silicone-LED-Night-Light-Cute-qepw5Oxu.jpeg.thumb_800x800.jpg'),
                  ),
                ),
                SizedBox(width: 5),
              ],
            ),
            SizedBox(
              height: 35,
            ),
            SearchBar(),
            SizedBox(
              height: 10,
            ),
            Filters(),
            Expanded(
              child: OrganizationList(),
            )
          ],
        ),
      ),
    );
  }
}
