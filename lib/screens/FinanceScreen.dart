import 'package:flutter/material.dart';
import 'package:heart_app/widgets/MainDrawer.dart';
import '../widgets/finance_info/FinanceInfo.dart';

class FinanceScreen extends StatelessWidget {
  static const routeName = '/finance';

  final List<Map<String, String>> financeInfos = [
    {
      'organization': 'Childrens Charity',
      'payment': '150.10',
      'perc': '47.95%'
    },
    {'organization': 'Tech Charity', 'payment': '62.05', 'perc': '19.83%'},
    {'organization': 'Animal Charity', 'payment': '100.85', 'perc': '32.22%'},
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
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemBuilder: (ctx, index) => FinanceInfo(
                    financeInfos[index]['organization'],
                    financeInfos[index]['payment'],
                    financeInfos[index]['perc']),
                itemCount: financeInfos.length,
              ),
            ),
          )
        ]));
  }
}
