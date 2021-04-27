import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

// import 'indicator.dart';

class FinanceChart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FinanceChartState();

  final List<Color> colors;
  final List<dynamic> monthlyPayments;

  FinanceChart(this.colors, this.monthlyPayments);
}

class FinanceChartState extends State<FinanceChart> {
  int touchedIndex;

  @override
  Widget build(BuildContext context) {

    return AspectRatio(
      aspectRatio: 1.3,
      child: Row(
        children: <Widget>[
          const SizedBox(
            height: 18,
          ),
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: PieChart(
                PieChartData(
                    pieTouchData: PieTouchData(touchCallback: (pieTouchResponse) {
                      setState(() {
                        if (pieTouchResponse.touchInput is FlLongPressEnd ||
                            pieTouchResponse.touchInput is FlPanEnd) {
                          touchedIndex = -1;
                        } else {
                          touchedIndex = pieTouchResponse.touchedSectionIndex;
                        }
                      });
                    }),
                    borderData: FlBorderData(
                      show: false,
                    ),
                    sectionsSpace: 0,
                    centerSpaceRadius: 60,
                    sections: showingSections(widget.colors, widget.monthlyPayments)),
              ),
            ),
          ),
        ],
      ),
    );
  }


  List<PieChartSectionData> showingSections(List<Color> colors, List<dynamic> monthlyPayments) {
    List<double> percs = calculatePerc(widget.monthlyPayments);

    return List.generate(monthlyPayments.length, (i)
    {
      final isTouched = i == touchedIndex;
      final double fontSize = isTouched ? 25 : 16;
      final double radius = isTouched ? 80 : 70;

      for (var payment in monthlyPayments) {
        print("payment in chart\n");
        print(payment);
        return PieChartSectionData(
          color: colors[i%colors.length],
          value: double.parse(monthlyPayments[i]['amount']),
          title: '${(percs[i]*100).toStringAsPrecision(3)}%',
          radius: radius,
          titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff)),
        );
      }
    }
    );}
  }

  List<double> calculatePerc (List<dynamic> monthlyPayments){
    double total = 0;
    List<double> percs = [];

   for (var value in monthlyPayments) {
     total += double.parse(value['amount']);
   }

    for (var value in monthlyPayments) {
      double perc =  double.parse(value['amount']) / total;
      percs.add(perc);
    }
   return percs;
  }
