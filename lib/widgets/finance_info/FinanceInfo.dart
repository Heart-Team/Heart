import 'package:flutter/material.dart';

class FinanceInfo extends StatelessWidget {
  final String organization;
  final String payment;

  FinanceInfo(this.organization, this.payment);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        padding: EdgeInsets.symmetric(horizontal: 50),
        // margin: EdgeInsets.only(left: 10, right: 10),
        width: double.infinity,
        height: size.height * 0.08,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                organization,
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
              ),
              SizedBox(
                width: size.width * 0.10,
              ),
              Text(
                payment,
                textAlign: TextAlign.right,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              )
            ]));
  }
}
