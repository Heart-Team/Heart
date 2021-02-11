import 'dart:collection';

import 'package:flutter/material.dart';

class FinanceInfo extends StatelessWidget {
  final Map<String, int> payments;

  FinanceInfo(
    this.payments,
  );

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // TODO: implement build
    return Column(
      children: [Container(height: size.height * 0.15, child: null)],
    );
  }
}
