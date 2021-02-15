import 'dart:collection';

import 'package:flutter/material.dart';

class FinanceInfo extends StatelessWidget {
  final String organization;
  final double payment;

  FinanceInfo(this.organization, this.payment);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // TODO: implement build
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        height: size.height * 0.05,
        child: Text(organization));
  }
}
