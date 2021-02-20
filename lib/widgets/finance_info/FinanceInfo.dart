import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FinanceInfo extends StatelessWidget {
  final String organization;
  final String payment;
  final String perc;

  FinanceInfo(this.organization, this.payment, this.perc);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        width: double.infinity,
        height: size.height * 0.08,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.all(Radius.circular(15)),
          boxShadow: [
            BoxShadow(color: Colors.black12.withOpacity(0.25), blurRadius: 15)
          ],
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
