import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:heart_app/theme.dart';

class FinanceInfo extends StatelessWidget {
  final String organization;
  final String payment;
  final String perc;
  final Color color;

  FinanceInfo(this.organization, this.payment, this.perc, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        width: double.infinity,
        // height: size.height * 0.08,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.all(Radius.circular(15)),
          boxShadow: [
            BoxShadow(color: Colors.black12.withOpacity(0.1), blurRadius: 15)
          ],
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                organization,
                style: TextStyle(
                  fontWeight: FontWeight.w700, 
                  fontSize: 20,
                  color: color
                ),
              ),
              Column(
                children: [
                  Text(
                    perc,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                  Text(
                    '\$ ' + payment,
                    textAlign: TextAlign.right,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  )
                ],
              )
            ]));
  }
}
