import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:heart_app/Providers/MonthlyPayments.dart';
import 'package:heart_app/Providers/User.dart';
import 'package:heart_app/screens/EmptyFinanceScreen.dart';
import 'package:heart_app/theme.dart';
import 'package:heart_app/widgets/MainDrawer.dart';
import 'package:heart_app/widgets/finance_info/Chart.dart';
import 'package:provider/provider.dart';
import '../widgets/finance_info/MonthlyPayment.dart';

class FinanceScreen extends StatefulWidget {
  static const routeName = '/finance';


  @override
  _FinanceScreenState createState() => _FinanceScreenState();
}

class _FinanceScreenState extends State<FinanceScreen> {

  // final List<Map<String, String>> financeInfos = [
  //   {
  //     'organization': 'Childrens Charity',
  //     'payment': '150.10',
  //   },
  //   {'organization': 'Tech Charity', 'payment': '62.05', 'perc': '19.83%'},
  //   {'organization': 'Animal Charity', 'payment': '100.85', 'perc': '32.22%'},
  //   {'organization': 'Environmental Charity', 'payment': '100.85', 'perc': '32.22%'},
  // ];

  // @override
  // void initState(){
  //   super.initState();
  //   // final paymentProvider = Provider.of<MonthlyPayments>(context, listen: false);
  //   // final user = Provider.of<User>(context,listen: false);
  //
  //   // paymentProvider.getPayments(user.userId);
  // }


  final List<Color> colors = [
    AppTheme().primaryColor,
    AppTheme().purple,
    AppTheme().green,
    AppTheme().blue,
    AppTheme().pink,
    AppTheme().yellow,
    AppTheme().red
  ];

  @override
  Widget build(BuildContext context) {

    final Size deviceSize = MediaQuery.of(context).size;
    final paymentProvider = Provider.of<MonthlyPayments>(context,listen: false);

    return Scaffold(
        backgroundColor: Colors.white,
        drawer: MainDrawer(),
        body: paymentProvider.monthlyPayments.length > 0 ? Column(children: [
          Container(
            padding: EdgeInsets.only(top: deviceSize.height * 0.07, bottom: 20),
            alignment: Alignment.topCenter,
            child: Text('Monthly Payment',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500)),
          ),
          FinanceChart(colors),
          Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemBuilder: (ctx, index) => MonthlyPayment(
                    paymentProvider.monthlyPayments[index]['charity'],
                    paymentProvider.monthlyPayments[index]['amount'],
                    // financeInfos[index]['perc'],
                    colors[index % 7]
                ),
                itemCount: paymentProvider.monthlyPayments.length,
              ),
            ),
          )
        ])
        :
        EmptyFinanceScreen()
    );
  }
}
