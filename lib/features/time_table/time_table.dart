import 'package:flutter/material.dart';
import 'package:globalcollegeapp/utils/constants/colors.dart';

import '../../common/widgets/appbar/appbar.dart';
import '../../utils/constants/sizes.dart';

class TimeTable extends StatelessWidget {
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


