import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'bar_data.dart';
class MyBarGraph extends StatelessWidget {
  final List<double> semSummary;

  const MyBarGraph({Key? key, required this.semSummary}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BarData myBarData = BarData(
      firstSem: semSummary[0],
      secondSem: semSummary[1],
      thirdSem: semSummary[2],
      fourthSem: semSummary[3],
      fifthSem: semSummary[4],
      sixthSem: semSummary[5],
      seventhSem: semSummary[6],
    );

    myBarData.initializeBarData(); // Initialize bar data

    return BarChart(
      BarChartData(
        minY: 100,
        maxY: 0,
        gridData: const FlGridData(show: false),
        borderData: FlBorderData(show: false),
        titlesData: const FlTitlesData(
          show: true,
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
           leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false, )),
           bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: true, getTitlesWidget: getBottomTitles)),
        ),
        barGroups: myBarData.barData.map(
              (data) => BarChartGroupData(
                x: data.x,
        barRods: [
          BarChartRodData(
            toY: data.y,
            color: const Color.fromRGBO(250, 170, 147, 1),
            width: 15,
            borderRadius: BorderRadius.circular(4),
            backDrawRodData: BackgroundBarChartRodData(
              show: true,
              toY: 100,
              color: Colors.blue,
            ),
          ),
        ],
        ),
        )
          .toList(),
      ),
    );
  }
}

Widget getBottomTitles(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Colors.grey,
    fontWeight: FontWeight.bold,
    fontSize: 12,
  );

  Widget text;
  switch (value.toInt()) {
    case 0:
      text = const Text('I', style: style,);
      break;
    case 1:
      text = const Text('II', style: style,);
      break;
    case 2:
      text = const Text('III', style: style,);
      break;
    case 3:
      text = const Text('IV', style: style,);
      break;
    case 4:
      text = const Text('V', style: style,);
      break;
    case 5:
      text = const Text('VI', style: style,);
      break;
    case 6:
      text = const Text('VII', style: style,);
      break;
    default:
      text = const Text('', style: style,);
      break;

  }

  return SideTitleWidget(axisSide: meta.axisSide, child: text);
}