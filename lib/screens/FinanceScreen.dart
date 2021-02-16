import 'package:flutter/material.dart';
import 'package:heart_app/widgets/MainDrawer.dart';
import '../widgets/finance_info/FinanceInfo.dart';

class FinanceScreen extends StatelessWidget {
  static const routeName = '/finance';

  final List<Map<String, double>> financeInfos = [
    {'Childrens Charity': 150.10},
    {'Tech Charity': 62.05},
    {'Animal Charity': 100.85}
  ];

  @override
  Widget build(BuildContext context) {
    final Size deviceSize = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Colors.white,
        drawer: MainDrawer(),
        body: Column(children: [
          Container(
            padding: EdgeInsets.only(top: deviceSize.height * 0.1),
            alignment: Alignment.topCenter,
            child: Text('Monthly Payment',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500)),
          ),
          SizedBox(
            height: deviceSize.height * 0.4,
          ),
          Container(
            // alignment: Alignment.topLeft,
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(children: []),
          )
        ]));
  }
}
