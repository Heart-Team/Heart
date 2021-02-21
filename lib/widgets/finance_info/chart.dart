import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'PieData.dart';

class Chart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: PieChart(PieChartData(sections: getSections())),
    );
  }

  getSections() {
    return PieData.data
        .asMap()
        .map<int, PieChartSectionData>((index, data) {
          final value = PieChartSectionData(
              color: data.color,
              value: data.perc,
              title: '${data.perc}%',
              titleStyle: TextStyle(fontSize: 16, color: Colors.white));
          return MapEntry(index, value);
        })
        .values
        .toList();
  }
}
