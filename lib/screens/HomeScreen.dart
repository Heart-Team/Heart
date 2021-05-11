import 'package:flutter/material.dart';
import 'package:heart_app/Providers/Filter.dart';
import 'package:heart_app/Providers/MonthlyPayments.dart';
import 'package:heart_app/Providers/Suggestions.dart';
import 'package:heart_app/Providers/Survey.dart';
import 'package:heart_app/theme.dart';
import 'package:heart_app/widgets/finance_info/MonthlyPayment.dart';
import 'package:heart_app/widgets/home/Filters.dart';
import 'package:heart_app/widgets/home/OrganizationList.dart';
import 'package:heart_app/widgets/home/OrganizationTile.dart';
import 'package:heart_app/widgets/home/Header.dart';
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
    Provider.of<User>(context, listen: false).getUserInfo();
    Provider.of<MonthlyPayments>(context,listen: false).getPayments();

    return Scaffold( 
      drawer: MainDrawer(),
      backgroundColor: Colors.white, 
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 40, 20, 20),
        child: Column(
          children: [
            Header(),
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
