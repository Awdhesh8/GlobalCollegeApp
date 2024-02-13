/*
import 'package:flutter/material.dart';
import 'package:globalcollegeapp/utils/constants/colors.dart';
import '../../common/widgets/appbar/appbar.dart';
import '../../data/api/api_services.dart';
import '../../utils/constants/sizes.dart';
import 'package:shimmer/shimmer.dart';

class TimeTable extends StatefulWidget {
  @override
  State<TimeTable> createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  Future<Timetable>? timetableData;

  @override
  void initState() {
    super.initState();
    timetableData = ApiService.getTimetable();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EColors.backgroundColor,
      appBar: const GAppBar(
        title: Text(
          'Time Table',
          style: TextStyle(
            fontSize: ESizes.appTitle,
            color: EColors.textPrimaryHeading,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: false,
      ),
      body: FutureBuilder<Timetable>(
        future: timetableData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            print('Error fetching timetable data: ${snapshot.error}');
            return Center(child: Text('Error fetching timetable data. Please try again.'));
          } else if (snapshot.hasData) {
            Timetable data = snapshot.data!;
            return DefaultTabController(
              length: data.days.length,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Container(
                      constraints: const BoxConstraints.expand(height: 60),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFE0E5),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xFFFFC1C5),
                            offset: Offset(-2, -2),
                            blurRadius: 5,
                            spreadRadius: 2,
                          ),
                          BoxShadow(
                            color: Colors.white,
                            offset: Offset(5, 5),
                            blurRadius: 5,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: TabBar(
                        padding: const EdgeInsets.all(8),
                        isScrollable: true,
                        physics: const BouncingScrollPhysics(),
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          color: const Color(0xFFFFE0E5),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0xFFFFC1C5),
                              offset: Offset(-2, -2),
                              blurRadius: 2,
                              spreadRadius: 1,
                            ),
                            BoxShadow(
                              color: Colors.white,
                              offset: Offset(5, 5),
                              blurRadius: 2,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        labelColor: const Color(0xFF3C4043),
                        tabs: data.days
                            .map((day) => Tab(
                          text: day.day,
                          iconMargin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        ))
                            .toList(),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: TabBarView(
                        children: data.days
                            .map((day) => buildDayTimetable(context, day))
                            .toList(),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Center(child: Text('No timetable data available.'));
          }
        },
      ),
    );
  }

  Widget buildDayTimetable(BuildContext context, Day day) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Timetable for ${day.day}',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF3C4043),
              ),
            ),
            const SizedBox(height: 20),
            if (day.periodData.isNotEmpty) ...{
              for (var periodEntry in day.periodData) ...{
                AnimatedTimetableEntry(
                  entry: periodEntry,
                ),
              }
            } else ...{
              Center(
                child: Text(
                  'No timetable available for ${day.day}',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
              ),
            },
            GestureDetector(
              onTap: () {
                // Handle lunch container tap
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                margin: const EdgeInsets.only(bottom: 16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFE0E5),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFFFFC1C5),
                      offset: Offset(-2, -2),
                      blurRadius: 5,
                      spreadRadius: 1,
                    ),
                    BoxShadow(
                      color: Color(0xFFFFE0E5),
                      offset: Offset(5, 5),
                      blurRadius: 5,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Lunch Break',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF3C4043),
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '12:00 PM - 1:00 PM',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildShimmerWidget() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        children: List.generate(
          3,  // Adjust the number of shimmer items as needed
              (index) => Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            height: 20,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ),
    );
  }
}

class AnimatedTimetableEntry extends StatelessWidget {
  final PeriodData entry;

  AnimatedTimetableEntry({required this.entry});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFE0E5),
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color(0xFFFFC1C5),
            offset: Offset(-2, -2),
            blurRadius: 5,
            spreadRadius: 1,
          ),
          BoxShadow(
            color: Colors.white,
            offset: Offset(5, 5),
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Lecturer ${entry.period ?? ''}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF3C4043),
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            entry.time ?? '',
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
          Text(
            entry.subject ?? '',
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Color(0xFF9C27B0),
            ),
          ),
          Text(
            'Prof. ${entry.teacher}',
            style: const TextStyle(
              color: Color(0xFF3C4043),
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}

class Timetable {
  final List<Day> days;
  final String message;
  final String status;

  Timetable({
    required this.days,
    required this.message,
    required this.status,
  });

  factory Timetable.fromJson(Map<String, dynamic> json) {
    List<dynamic> timetableData = json['response'];
    List<Day> days = timetableData.map((dayData) => Day.fromJson(dayData)).toList();

    return Timetable(
      days: days,
      message: json['message'],
      status: json['status'],
    );
  }
}

class Day {
  final String day;
  final List<PeriodData> periodData;

  Day({
    required this.day,
    required this.periodData,
  });

  factory Day.fromJson(Map<String, dynamic> json) {
    List<dynamic> periodDataList = json['perioddata'];
    List<PeriodData> periodData =
    periodDataList.map((periodEntry) => PeriodData.fromJson(periodEntry)).toList();

    return Day(
      day: json['day'],
      periodData: periodData,
    );
  }
}

class PeriodData {
  final String period;
  final String time;
  final String subject;
  final String teacher;

  PeriodData({
    required this.period,
    required this.time,
    required this.subject,
    required this.teacher,
  });

  factory PeriodData.fromJson(Map<String, dynamic> json) {
    return PeriodData(
      period: json['period'],
      time: json['time'],
      subject: json['subject'],
      teacher: json['teacher'],
    );
  }
}


 */
///

import 'package:flutter/material.dart';
import 'package:globalcollegeapp/features/time_table/widgets/decoration/contanier_decoration.dart';
import 'package:globalcollegeapp/utils/constants/colors.dart';

import '../../common/widgets/appbar/appbar.dart';
import '../../data/api/api_services.dart';
import '../../utils/constants/sizes.dart';

class TimeTable extends StatefulWidget {
  @override
  State<TimeTable> createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EColors.backgroundColor,
      appBar: const GAppBar(
        title: Text(
          'Time Table',
          style: TextStyle(
            fontSize: ESizes.appTitle,
            color: EColors.textPrimaryHeading,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: false,
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: ApiService.fetchTimetable(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            Map<String, dynamic> responseData = snapshot.data!;
            List<dynamic> timetableData = responseData['response'] ?? [];

            return DefaultTabController(
              length: timetableData.length,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Container(
                      constraints: const BoxConstraints.expand(height: 60),
                      decoration: customDecoration(),
                      child: TabBar(
                        padding: const EdgeInsets.all(8),
                        isScrollable: true,
                        physics: const BouncingScrollPhysics(),
                        indicator: customDecoration(),
                        labelColor: const Color(0xFF3C4043),
                        tabs: timetableData
                            .map((dayData) {
                          String day = dayData.keys.first;
                          return Tab(
                            text: day,
                            iconMargin: const EdgeInsets.symmetric(
                              horizontal: 5,
                              vertical: 5,
                            ),
                          );
                        })
                            .cast<Widget>()
                            .toList(),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: TabBarView(
                        children: timetableData
                            .map((dayData) {
                          String day = dayData.keys.first;
                          List<Map<String, dynamic>> timetableForDay =
                              (dayData[day] as List?)?.cast<Map<String, dynamic>>() ?? [];
                          return buildDayTimetable(day, timetableForDay);
                        })
                            .cast<Widget>()
                            .toList(),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Center(child: Text('Invalid API response format.'));
          }
        },
      ),
    );
  }

  Widget buildDayTimetable(String day, List<Map<String, dynamic>> timetableForDay) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Timetable for $day',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF3C4043),
              ),
            ),
            const SizedBox(height: 20),
            for (var entry in timetableForDay)
              buildTimetableCard(entry),
            // ... Additional UI elements
          ],
        ),
      ),
    );
  }

  Widget buildTimetableCard(Map<String, dynamic> entry) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        title: Text(
          'Period ${entry['period'] ?? ''}',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF3C4043),
            fontSize: 16,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              entry['time'] ?? '',
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
            Text(
              entry['subject'] ?? '',
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: Color(0xFF9C27B0),
              ),
            ),
            if (entry['teacher'] != null)
              Text(
                'Teacher: ${entry['teacher']}',
                style: const TextStyle(
                  color: Color(0xFF3C4043),
                  fontSize: 13,
                ),
              ),
          ],
        ),
      ),
    );
  }
}


class AnimatedTimetableEntry extends StatelessWidget {
  final Map<String, dynamic> entry;

  AnimatedTimetableEntry({required this.entry});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: customDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Period ${entry['period'] ?? ''}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF3C4043),
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            entry['time'] ?? '',
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
          Text(
            entry['subject'] ?? '',
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Color(0xFF9C27B0),
            ),
          ),
          if (entry['teacher'] != null)
            Text(
              'Teacher: ${entry['teacher']}',
              style: const TextStyle(
                color: Color(0xFF3C4043),
                fontSize: 13,
              ),
            ),
        ],
      ),
    );
  }
}

//var headers = {
//   'Cookie': 'ci_session=3obslvn95emuo6635jurbm9blaoil578'
// };
// var request = http.MultipartRequest('POST', Uri.parse('http://myglobalapp.in/global/API005/student_timetable'));
// request.fields.addAll({
//   'APIKEY': 'GNCS0225',
//   'USER_ID': '',
//   'USER_TYPE': ''
// });
//
// request.headers.addAll(headers);
//
// http.StreamedResponse response = await request.send();
//
// if (response.statusCode == 200) {
//   print(await response.stream.bytesToString());
// }
// else {
//   print(response.reasonPhrase);
// }
// integrate this API
// and take the user_id and user_type form the local storage and
// this is the response Body of the
// api
// {
//     "response": [
//         {
//             "Monday": [
//                 {
//                     "period": "I",
//                     "time": "9:40 -10:40",
//                     "subject": "AWP",
//                     "teacher": "POORNANAND  DUBEY"
//                 },
//                 {
//                     "period": "II",
//                     "time": "10:40 -11:40",
//                     "subject": "AWP",
//                     "teacher": "POORNANAND  DUBEY"
//                 },
//                 {
//                     "period": "III",
//                     "time": "12:10 - 1:10",
//                     "subject": "D COM",
//                     "teacher": "Rajendra  Singh  Yadav "
//                 },
//                 {
//                     "period": "IV",
//                     "time": "1:10 - 2:10",
//                     "subject": "DCL",
//                     "teacher": "Rajendra  Singh  Yadav "
//                 },
//                 {
//                     "period": "V",
//                     "time": "2:20 - 3:15",
//                     "subject": "DCL",
//                     "teacher": "Rajendra  Singh  Yadav "
//                 },
//                 {
//                     "period": "VI",
//                     "time": "3:15 - 4:10",
//                     "subject": "DCL",
//                     "teacher": "Rajendra  Singh  Yadav "
//                 }
//             ]
//         },
//         {
//             "Tuesday": [
//                 {
//                     "period": "I",
//                     "time": "9:40 -10:40",
//                     "subject": "DSP",
//                     "teacher": "NIRDESH   JAIN"
//                 },
//                 {
//                     "period": "II",
//                     "time": "10:40 -11:40",
//                     "subject": "MES",
//                     "teacher": "PRATEEK  MISHRA"
//                 },
//                 {
//                     "period": "III",
//                     "time": "12:10 - 1:10",
//                     "subject": "D COM",
//                     "teacher": "Rajendra  Singh  Yadav "
//                 },
//                 {
//                     "period": "IV",
//                     "time": "1:10 - 2:10",
//                     "subject": "MES",
//                     "teacher": "PRATEEK  MISHRA"
//                 },
//                 {
//                     "period": "V",
//                     "time": "2:20 - 3:15",
//                     "subject": "MES",
//                     "teacher": "PRATEEK  MISHRA"
//                 },
//                 {
//                     "period": "VI",
//                     "time": "3:15 - 4:10",
//                     "subject": "D COM",
//                     "teacher": "Rajendra  Singh  Yadav "
//                 }
//             ]
//         },
//         {
//             "Wednesday": [
//                 {
//                     "period": "I",
//                     "time": "9:40 -10:40",
//                     "subject": "AWP",
//                     "teacher": "POORNANAND  DUBEY"
//                 },
//                 {
//                     "period": "II",
//                     "time": "10:40 -11:40",
//                     "subject": "D COM",
//                     "teacher": "Rajendra  Singh  Yadav "
//                 },
//                 {
//                     "period": "III",
//                     "time": "12:10 - 1:10",
//                     "subject": "DCL",
//                     "teacher": "Rajendra  Singh  Yadav "
//                 },
//                 {
//                     "period": "IV",
//                     "time": "1:10 - 2:10",
//                     "subject": "DSP",
//                     "teacher": "NIRDESH   JAIN"
//                 },
//                 {
//                     "period": "V",
//                     "time": "2:20 - 3:15",
//                     "subject": "DSP",
//                     "teacher": "NIRDESH   JAIN"
//                 },
//                 {
//                     "period": "VI",
//                     "time": "3:15 - 4:10",
//                     "subject": "MES",
//                     "teacher": "PRATEEK  MISHRA"
//                 }
//             ]
//         },
//         {
//             "Thursday": [
//                 {
//                     "period": "I",
//                     "time": "9:40 -10:40",
//                     "subject": "MES",
//                     "teacher": "PRATEEK  MISHRA"
//                 },
//                 {
//                     "period": "II",
//                     "time": "10:40 -11:40",
//                     "subject": "MES Lab",
//                     "teacher": "PRATEEK  MISHRA"
//                 },
//                 {
//                     "period": "III",
//                     "time": "12:10 - 1:10",
//                     "subject": "MES Lab",
//                     "teacher": "PRATEEK  MISHRA"
//                 },
//                 {
//                     "period": "IV",
//                     "time": "1:10 - 2:10",
//                     "subject": "DCL",
//                     "teacher": "Rajendra  Singh  Yadav "
//                 },
//                 {
//                     "period": "V",
//                     "time": "2:20 - 3:15",
//                     "subject": "D COM",
//                     "teacher": "Rajendra  Singh  Yadav "
//                 },
//                 {
//                     "period": "VI",
//                     "time": "3:15 - 4:10",
//                     "subject": "D COM",
//                     "teacher": "Rajendra  Singh  Yadav "
//                 }
//             ]
//         },
//         {
//             "Friday": [
//                 {
//                     "period": "I",
//                     "time": "9:40 -10:40",
//                     "subject": "AWP",
//                     "teacher": "POORNANAND  DUBEY"
//                 },
//                 {
//                     "period": "II",
//                     "time": "10:40 -11:40",
//                     "subject": "D COM",
//                     "teacher": "Rajendra  Singh  Yadav "
//                 },
//                 {
//                     "period": "III",
//                     "time": "12:10 - 1:10",
//                     "subject": "AWP",
//                     "teacher": "POORNANAND  DUBEY"
//                 },
//                 {
//                     "period": "IV",
//                     "time": "1:10 - 2:10",
//                     "subject": "AWP",
//                     "teacher": "POORNANAND  DUBEY"
//                 },
//                 {
//                     "period": "V",
//                     "time": "2:20 - 3:15",
//                     "subject": "D COM",
//                     "teacher": "Rajendra  Singh  Yadav "
//                 },
//                 {
//                     "period": "VI",
//                     "time": "3:15 - 4:10",
//                     "subject": "D COM",
//                     "teacher": "Rajendra  Singh  Yadav "
//                 }
//             ]
//         }
//     ],
//     "message": "Successfully",
//     "status": "1"
// }
//
// use this widget
// show this details on the tab bar
// import 'package:flutter/material.dart';
// import 'package:globalcollegeapp/features/time_table/widgets/decoration/contanier_decoration.dart';
// import 'package:globalcollegeapp/utils/constants/colors.dart';
//
// import '../../common/widgets/appbar/appbar.dart';
// import '../../data/api/api_services.dart';
// import '../../utils/constants/sizes.dart';
//
// class TimeTable extends StatefulWidget {
//   @override
//   State<TimeTable> createState() => _TimeTableState();
// }
//
// class _TimeTableState extends State<TimeTable> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: EColors.backgroundColor,
//       appBar: const GAppBar(
//         title: Text(
//           'Time Table',
//           style: TextStyle(
//             fontSize: ESizes.appTitle,
//             color: EColors.textPrimaryHeading,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         backgroundColor: Colors.transparent,
//         centerTitle: false,
//       ),
//       body:



///

///
/*
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../data/api/api_services.dart';

// class Timetable {
//   final String day;
//   final List<Map<String, String>> periodData;
//
//   Timetable({required this.day, required this.periodData});
//
//   factory Timetable.fromJson(Map<String, dynamic> json) {
//     return Timetable(
//       day: json['day'],
//       periodData: (json['perioddata'] as List)
//           .map((period) => {
//         'period': period['period'].toString(),
//         'time': period['time'].toString(),
//         'subject': period['subject'].toString(),
//         'teacher': period['teacher'].toString(),
//       })
//           .toList(),
//     );
//   }
//
// }

class TimeTable extends StatefulWidget {
  @override
  _TimeTableState createState() => _TimeTableState();
}

class Timetable {
  final String day;
  final List<PeriodData> periodData;

  Timetable({required this.day, required this.periodData});

  factory Timetable.fromJson(Map<String, dynamic> json) {
    return Timetable(
      day: json['day'],
      periodData: (json['perioddata'] as List)
          .map((period) => PeriodData.fromJson(period))
          .toList(),
    );
  }
}

class PeriodData {
  final String period;
  final String time;
  final String subject;
  final String teacher;

  PeriodData({
    required this.period,
    required this.time,
    required this.subject,
    required this.teacher,
  });

  factory PeriodData.fromJson(Map<String, dynamic> json) {
    return PeriodData(
      period: json['period'],
      time: json['time'],
      subject: json['subject'],
      teacher: json['teacher'],
    );
  }
}

class _TimeTableState extends State<TimeTable> {
  List<Timetable> timetableList = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final responseData = await ApiService.fetchTimetable();

      if (responseData['status'] == '1') {
        List<dynamic> responseList = responseData['response'];
        timetableList =
            responseList.map((item) => Timetable.fromJson(item)).toList();

        // Debug prints
        print('Timetable List Length: ${timetableList.length}');
        for (var timetable in timetableList) {
          print('Day: ${timetable.day}');
          for (var period in timetable.periodData) {
            print(
                'Period: ${period.period}, Time: ${period.time}, Subject: ${period.subject}, Teacher: ${period.teacher}');
          }
        }

        setState(() {});
      } else {
        print(responseData['message']);
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timetable'),
      ),
      body: timetableList.isEmpty
          ? Center(child: CircularProgressIndicator())
          : DefaultTabController(
              length: timetableList.length,
              child: Column(
                children: [
                  TabBar(
                    tabs: timetableList
                        .map((timetable) => Tab(text: timetable.day))
                        .toList(),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: timetableList.map((timetable) {
                        return ListView.builder(
                          itemCount: timetable.periodData.length,
                          itemBuilder: (context, index) {
                            final period = timetable.periodData[
                                index]; // Accessing PeriodData object

                            return ListTile(
                              title: Text(
                                  'Period: ${period.period}'), // Using period property
                              subtitle: Text(
                                  'Time: ${period.time}'), // Using time property
                              trailing: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                      'Subject: ${period.subject}'), // Using subject property
                                  Text(
                                      'Teacher: ${period.teacher}'), // Using teacher property
                                ],
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

 */

/*
import 'package:flutter/material.dart';
import 'package:globalcollegeapp/utils/constants/colors.dart';

import '../../common/widgets/appbar/appbar.dart';
import '../../utils/constants/sizes.dart';

class TimeTable extends StatefulWidget {
  @override
  State<TimeTable> createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  final Map<String, List<Map<String, dynamic>>> timetableData = {
    'Monday': [
      {
        'Lecturer': '1',
        'subject': 'Orbital Mechanics',
        'professor': 'Prof. Amelia Bennett',
        'time': '9:00 AM',
      },
      {
        'Lecturer': '2',
        'subject': 'Spacecraft Design & Systems Engineering',
        'professor': 'Prof. Marcus Rodriguez',
        'time': '9:45 AM',
      },
      {
        'Lecturer': '3',
        'subject': 'Aerodynamics',
        'professor': 'Prof. Elena Chang',
        'time': '10:30 AM',
      },
    ],
    'Tuesday': [
      {
        'Lecturer': '1',
        'subject': 'Orbital Mechanics',
        'professor': 'Prof. Amelia Bennett',
        'time': '9:00 AM',
      },
      {
        'Lecturer': '2',
        'subject':
        'Spacecraft Design & Systems Engineering & Systems Engineering',
        'professor': 'Prof. Marcus Rodriguez',
        'time': '9:45 AM',
      },
      {
        'Lecturer': '3',
        'subject': 'Aerodynamics',
        'professor': 'Prof. Elena Chang',
        'time': '10:30 AM',
      },
    ],
    'Wednesday': [
      {
        'Lecturer': '1',
        'subject': 'Orbital Mechanics',
        'professor': 'Prof. Amelia Bennett',
        'time': '9:00 AM',
      },
      {
        'Lecturer': '2',
        'subject':
        'Spacecraft Design & Systems Engineering & Systems Engineering',
        'professor': 'Prof. Marcus Rodriguez',
        'time': '9:45 AM',
      },
      {
        'Lecturer': '3',
        'subject': 'Aerodynamics',
        'professor': 'Prof. Elena Chang',
        'time': '10:30 AM',
      },
    ],
    'Thursday': [
      {
        'Lecturer': '1',
        'subject': 'Orbital Mechanics',
        'professor': 'Prof. Amelia Bennett',
        'time': '9:00 AM',
      },
      {
        'Lecturer': '2',
        'subject':
        'Spacecraft Design & Systems Engineering & Systems Engineering',
        'professor': 'Prof. Marcus Rodriguez',
        'time': '9:45 AM',
      },
      {
        'Lecturer': '3',
        'subject': 'Aerodynamics',
        'professor': 'Prof. Elena Chang',
        'time': '10:30 AM',
      },
    ],
    'Friday': [
      {
        'Lecturer': '1',
        'subject': 'Orbital Mechanics',
        'professor': 'Prof. Amelia Bennett',
        'time': '9:00 AM',
      },
      {
        'Lecturer': '2',
        'subject':
        'Spacecraft Design & Systems Engineering & Systems Engineering',
        'professor': 'Prof. Marcus Rodriguez',
        'time': '9:45 AM',
      },
      {
        'Lecturer': '3',
        'subject': 'Aerodynamics',
        'professor': 'Prof. Elena Chang',
        'time': '10:30 AM',
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EColors.backgroundColor,
      appBar: const GAppBar(
        title: Text(
          'Time Table',
          style: TextStyle(
            fontSize: ESizes.appTitle,
            color: EColors.textPrimaryHeading,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: false,
      ),
      body: DefaultTabController(
        length: timetableData.length,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                constraints: const BoxConstraints.expand(height: 60),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFE0E5),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFFFFC1C5),
                      offset: Offset(-2, -2),
                      blurRadius: 5,
                      spreadRadius: 2,
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(5, 5),
                      blurRadius: 5,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: TabBar(
                  padding: const EdgeInsets.all(8),
                  isScrollable: true,
                  physics: const BouncingScrollPhysics(),
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    color: const Color(0xFFFFE0E5),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0xFFFFC1C5),
                        offset: Offset(-2, -2),
                        blurRadius: 2,
                        spreadRadius: 1,
                      ),
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(5, 5),
                        blurRadius: 2,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  labelColor: const Color(0xFF3C4043),
                  tabs: timetableData.keys
                      .map((day) => Tab(
                    text: day,
                    iconMargin:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  ))
                      .toList(),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: TabBarView(
                  children: timetableData.keys
                      .map((day) => buildDayTimetable(context, day))
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDayTimetable(BuildContext context, String day) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Timetable for $day',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF3C4043),
              ),
            ),
            const SizedBox(height: 20),
            for (var entry in timetableData[day]!)
              AnimatedTimetableEntry(entry: entry),
            // Lunch Container
            GestureDetector(
              onTap: () {
                // Handle lunch container tap
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                margin: const EdgeInsets.only(bottom: 16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFE0E5),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFFFFC1C5),
                      offset: Offset(-2, -2),
                      blurRadius: 5,
                      spreadRadius: 1,
                    ),
                    BoxShadow(
                      color: Color(0xFFFFE0E5),
                      offset: Offset(5, 5),
                      blurRadius: 5,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Lunch Break',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF3C4043),
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '12:00 PM - 1:00 PM',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class AnimatedTimetableEntry extends StatelessWidget {
  final Map<String, dynamic> entry;

  AnimatedTimetableEntry({required this.entry});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFE0E5),
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color(0xFFFFC1C5),
            offset: Offset(-2, -2),
            blurRadius: 5,
            spreadRadius: 1,
          ),
          BoxShadow(
            color: Colors.white,
            offset: Offset(5, 5),
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Lecturer ${entry['period'] ?? ''}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF3C4043),
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            entry['time'] ?? '',
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
          Text(
            entry['subject'] ?? '',
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Color(0xFF9C27B0),
            ),
          ),
          if (entry['professor'] != null)
            Text(
              'Prof. ${entry['professor']}',
              style: const TextStyle(
                color: Color(0xFF3C4043),
                fontSize: 13,
              ),
            ),
        ],
      ),
    );
  }
}


 */
