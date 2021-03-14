import 'package:flutter/material.dart';
import 'package:heart_app/widgets/MainDrawer.dart';
import 'package:heart_app/theme.dart';

class EmptyFinanceScreen extends StatelessWidget {
  static const routeName = '/empty-finance';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: MainDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 30,
          ),
          Image.asset('assets/images/no_data.png'),
          Container(
              alignment: Alignment.center,
              child: Text("No payment records found.",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600))),
          Container(
              alignment: Alignment.center,
              child: Text("Please choose a charity to donate.",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600))),
          SizedBox(
            height: 30,
          ),
          MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 6),
              color: AppTheme().primaryColor,
              child: Text('All Done',
                  style: TextStyle(fontSize: 20, color: Colors.white)),
              onPressed: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/', (route) => false);
              })
        ],
      ),
    );
  }
}
