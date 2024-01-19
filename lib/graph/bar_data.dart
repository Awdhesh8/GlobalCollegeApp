import 'individual_bar.dart';

class BarData {
  final double firstSem;
  final double secondSem;
  final double thirdSem;
  final double fourthSem;
  final double fifthSem;
  final double sixthSem;
  final double seventhSem;

  BarData({
    required this.firstSem,
    required this.secondSem,
    required this.thirdSem,
    required this.fourthSem,
    required this.fifthSem,
    required this.sixthSem,
    required this.seventhSem,

});

  List<IndividualBar> barData = [];


  //
void initializeBarData() {
  barData = [
    IndividualBar(x: 0, y: firstSem),
    IndividualBar(x: 1, y: secondSem),
    IndividualBar(x: 2, y: thirdSem),
    IndividualBar(x: 3, y: fourthSem),
    IndividualBar(x: 4, y: fifthSem),
    IndividualBar(x: 5, y: sixthSem),
    IndividualBar(x: 6, y: seventhSem),

  ];
}
}