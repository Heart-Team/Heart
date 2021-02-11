import 'package:flutter/material.dart';
import 'package:heart_app/widgets/MainDrawer.dart';

class FinanceScreen extends StatelessWidget {
  static const routeName = '/finance';

  @override
  Widget build(BuildContext context) {
    final Size deviceSize = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Colors.white,
        drawer: MainDrawer(),
        body: Container(
          padding: EdgeInsets.only(top: deviceSize.height * 0.1),
          alignment: Alignment.topCenter,
          child: Text('Monthly Payment',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500)),
        ));
  }
}
