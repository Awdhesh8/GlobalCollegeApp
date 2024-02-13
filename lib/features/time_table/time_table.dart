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
    // Call the getTimetable function when the widget initializes
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
            // Display loading indicator or shimmer while data is being fetched
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            // Display error message
            print('Error fetching timetable data: ${snapshot.error}');
            return Center(child: Text('Error fetching timetable data. Please try again.'));
          } else if (snapshot.hasData) {
            // Data has been successfully fetched, display it
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
            // Data is null
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
                  entry: {
                    'period': periodEntry.period,
                    'time': periodEntry.time,
                    'subject': periodEntry.subject,
                    'professor': periodEntry.teacher,
                  },
                ),
              }
            } else ...{
              // Handle case when dayData is empty
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
    List<PeriodData> periodData = periodDataList.map((periodEntry) => PeriodData.fromJson(periodEntry)).toList();

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


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Timetable {
  final String day;
  final List<Map<String, String>> periodData;

  Timetable({required this.day, required this.periodData});

  factory Timetable.fromJson(Map<String, dynamic> json) {
    return Timetable(
      day: json['day'],
      periodData: List<Map<String, String>>.from(
        json['perioddata'].map((period) => {
          'period': period['period'],
          'time': period['time'],
          'subject': period['subject'],
          'teacher': period['teacher'],
        }),
      ),
    );
  }
}


class TimeTable extends StatefulWidget {
  @override
  _TimeTableState createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  List<Timetable> timetableList = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    // Replace the API URL with your actual API URL
    final response = await http.post(
      Uri.parse('http://myglobalapp.in/global/API005/student_timetable'),
      headers: {'Cookie': 'ci_session=9ra9jatp0nme44evvun9oqb0tm703fur'},
      body: {
        'APIKEY': 'GNCS0225',
        'USER_ID': '1069',
        'USER_TYPE': '2',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      if (responseData['status'] == '1') {
        List<dynamic> responseList = responseData['response'];
        timetableList = responseList.map((item) => Timetable.fromJson(item)).toList();
        setState(() {});
      } else {
        print(responseData['message']);
      }
    } else {
      print('Error: ${response.reasonPhrase}');
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
                      final period = timetable.periodData[index];
                      return ListTile(
                        title: Text('Period: ${period['period']}'),
                        subtitle: Text('Time: ${period['time']}'),
                        trailing: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('Subject: ${period['subject']}'),
                            Text('Teacher: ${period['teacher']}'),
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
