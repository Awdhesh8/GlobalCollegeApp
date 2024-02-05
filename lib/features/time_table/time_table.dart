
import 'package:flutter/material.dart';
import 'package:globalcollegeapp/utils/constants/colors.dart';

import '../../common/widgets/appbar/appbar.dart';
import '../../utils/constants/sizes.dart';

class TimeTable extends StatelessWidget {
  final Map<String, List<Map<String, dynamic>>> timetableData = {
    'Monday': [
      {
        'period': '1',
        'subject': 'Orbital Mechanics',
        'professor': 'Prof. Amelia Bennett',
        'time': '9:00 AM',
      },
      {
        'period': '2',
        'subject': 'Spacecraft Design & Systems Engineering',
        'professor': 'Prof. Marcus Rodriguez',
        'time': '9:45 AM',
      },
      {
        'period': '3',
        'subject': 'Aerodynamics',
        'professor': 'Prof. Elena Chang',
        'time': '10:30 AM',
      },
    ],
    'Tuesday': [
      {
        'period': '1',
        'subject': 'Orbital Mechanics',
        'professor': 'Prof. Amelia Bennett',
        'time': '9:00 AM',
      },
      {
        'period': '2',
        'subject':
        'Spacecraft Design & Systems Engineering & Systems Engineering',
        'professor': 'Prof. Marcus Rodriguez',
        'time': '9:45 AM',
      },
      {
        'period': '3',
        'subject': 'Aerodynamics',
        'professor': 'Prof. Elena Chang',
        'time': '10:30 AM',
      },
    ],
    'Wednesday': [
      {
        'period': '1',
        'subject': 'Orbital Mechanics',
        'professor': 'Prof. Amelia Bennett',
        'time': '9:00 AM',
      },
      {
        'period': '2',
        'subject':
        'Spacecraft Design & Systems Engineering & Systems Engineering',
        'professor': 'Prof. Marcus Rodriguez',
        'time': '9:45 AM',
      },
      {
        'period': '3',
        'subject': 'Aerodynamics',
        'professor': 'Prof. Elena Chang',
        'time': '10:30 AM',
      },
    ],
    'Thursday': [
      {
        'period': '1',
        'subject': 'Orbital Mechanics',
        'professor': 'Prof. Amelia Bennett',
        'time': '9:00 AM',
      },
      {
        'period': '2',
        'subject':
        'Spacecraft Design & Systems Engineering & Systems Engineering',
        'professor': 'Prof. Marcus Rodriguez',
        'time': '9:45 AM',
      },
      {
        'period': '3',
        'subject': 'Aerodynamics',
        'professor': 'Prof. Elena Chang',
        'time': '10:30 AM',
      },
    ],
    'Friday': [
      {
        'period': '1',
        'subject': 'Orbital Mechanics',
        'professor': 'Prof. Amelia Bennett',
        'time': '9:00 AM',
      },
      {
        'period': '2',
        'subject':
        'Spacecraft Design & Systems Engineering & Systems Engineering',
        'professor': 'Prof. Marcus Rodriguez',
        'time': '9:45 AM',
      },
      {
        'period': '3',
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
                constraints: BoxConstraints.expand(height: 60),
                decoration: BoxDecoration(
                  color: Color(0xFFFFE0E5),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFFFC1C5),
                      offset: Offset(-5, -5),
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
                  padding: EdgeInsets.all(8),
                  isScrollable: true,
                  physics: BouncingScrollPhysics(),
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Color(0xFFFFE0E5),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFFFFC1C5),
                        offset: Offset(-5, -5),
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
                  labelColor: Color(0xFF3C4043),
                  tabs: timetableData.keys
                      .map((day) => Tab(
                    text: day,
                    iconMargin:
                    EdgeInsets.symmetric(horizontal: 5, vertical: 5),
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
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF3C4043),
              ),
            ),
            SizedBox(height: 20),
            for (var entry in timetableData[day]!)
              AnimatedTimetableEntry(entry: entry),
            // Lunch Container
            GestureDetector(
              onTap: () {
                // Handle lunch container tap
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                margin: EdgeInsets.only(bottom: 16),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xFFFFE0E5),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFFFC1C5),
                      offset: Offset(-5, -5),
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
                child: Column(
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
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFFFFE0E5),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Color(0xFFFFC1C5),
            offset: Offset(-5, -5),
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
            'Period ${entry['period'] ?? ''}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF3C4043),
              fontSize: 20,
            ),
          ),
          SizedBox(height: 8),
          Text(
            entry['time'] ?? '',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
          ),
          Text(
            entry['subject'] ?? '',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF9C27B0),
            ),
          ),
          if (entry['professor'] != null)
            Text(
              'Prof. ${entry['professor']}',
              style: TextStyle(
                color: Color(0xFF3C4043),
                fontSize: 16,
              ),
            ),
        ],
      ),
    );
  }
}


/// Original code of the timetable screen ---->
/*

import 'package:flutter/material.dart';
import 'package:globalcollegeapp/features/time_table/time_table_data.dart';
import 'package:globalcollegeapp/utils/constants/sizes.dart';
import '../../common/widgets/appbar/appbar.dart';
import '../../utils/constants/colors.dart';

class TimeTable extends StatefulWidget {
  const TimeTable({
    Key? key,
  }) : super(key: key);

  @override
  State<TimeTable> createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  final Map<String, List<Map<String, String>>> timetableData = {
    'Monday': [
      {
        'period': '1',
        'subject': 'Orbital Mechanics',
        'professor': 'Prof. Amelia Bennett',
        'time': '9:00 AM',
      },
      {
        'period': '2',
        'subject': 'Spacecraft Design & Systems Engineering',
        'professor': 'Prof. Marcus Rodriguez',
        'time': '9:45 AM',
      },
      {
        'period': '3',
        'subject': 'Aerodynamics',
        'professor': 'Prof. Elena Chang',
        'time': '10:30 AM',
      },
      {
        'period': '4',
        'subject': 'Orbital Mechanics',
        'professor': 'Prof. Amelia Bennett',
        'time': '9:00 AM',
      },
      {
        'period': '5',
        'subject': 'Orbital Mechanics',
        'professor': 'Prof. Amelia Bennett',
        'time': '9:00 AM',
      },
      {
        'period': '6',
        'subject': 'Orbital Mechanics',
        'professor': 'Prof. Amelia Bennett',
        'time': '9:00 AM',
      },

      // Add more entries for Monday as needed
    ],
    'Tuesday': [
      {
        'period': '1',
        'subject': 'Orbital Mechanics',
        'professor': 'Prof. Amelia Bennett',
        'time': '9:00 AM',
      },
      {
        'period': '2',
        'subject':
            'Spacecraft Design & Systems Engineering & Systems Engineering',
        'professor': 'Prof. Marcus Rodriguez',
        'time': '9:45 AM',
      },
      {
        'period': '3',
        'subject': 'Aerodynamics',
        'professor': 'Prof. Elena Chang',
        'time': '10:30 AM',
      },
      {
        'period': '4',
        'subject': 'Aerodynamics',
        'professor': 'Prof. Elena Chang',
        'time': '10:30 AM',
      },
      {
        'period': '5',
        'subject': 'Aerodynamics',
        'professor': 'Prof. Elena Chang',
        'time': '10:30 AM',
      },

      // Add more entries for Monday as needed
    ],
    // Repeat the same structure for other days
    // 'Tuesday': [...],
    // 'Wednesday': [...],
    // 'Thursday': [...],
    // 'Friday': [...],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EColors.backgroundColor,
      appBar: const GAppBar(
        backgroundColor: Colors.transparent,
        showBackArrow: false,
        title: Text(
          'Time Table',
          style: TextStyle(
              fontSize: ESizes.appTitle,
              color: EColors.textPrimaryHeading,
              fontWeight: FontWeight.w600),
        ),
        centerTitle: false,
      ),

      /// Body
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Column(
          children: [



            Expanded(
              child: TimetableScreen(),
            ),



          ],
        ),
      ),
    );
  }
}


 */


/// -------->>>>>>>>>>

/*

  // // Day-wise timetable
            // for (final day in timetableData.keys)
            //   Column(
            //     children: [
            //       const SizedBox(height: ESizes.spaceBtwItemsHeadings),
            //       Row(
            //         children: [
            //           Text(
            //             day,
            //             style: const TextStyle(
            //                 fontSize: ESizes.fontSizeSm,
            //                 color: EColors.textPrimaryHeading,
            //                 fontWeight: FontWeight.w600),
            //           ),
            //         ],
            //       ),
            //       const SizedBox(height: ESizes.spaceBtwItemsHeadings),
            //       Row(
            //         children: [
            //           Expanded(
            //             child: Container(
            //               width: double.infinity,
            //               height: 50,
            //               decoration: ShapeDecoration(
            //                 color: Colors.white,
            //                 shape: RoundedRectangleBorder(
            //                   borderRadius: BorderRadius.circular(15),
            //                 ),
            //               ),
            //               child: const Padding(
            //                 padding: EdgeInsets.all(8.0),
            //                 child: Row(
            //                   mainAxisAlignment:
            //                       MainAxisAlignment.spaceBetween,
            //                   children: [
            //                     Text(
            //                       'Period',
            //                       style: TextStyle(
            //                         color: Color(0xFF353535),
            //                         fontSize: 14,
            //                         fontFamily: 'Inter',
            //                         fontWeight: FontWeight.w500,
            //                       ),
            //                     ),
            //                     Text(
            //                       'Subject &\nProfessor',
            //                       style: TextStyle(
            //                         color: Color(0xFF353535),
            //                         fontSize: 14,
            //                         fontFamily: 'Inter',
            //                         fontWeight: FontWeight.w500,
            //                         height: 0,
            //                       ),
            //                     ),
            //                     Text(
            //                       'Class begins',
            //                       style: TextStyle(
            //                         color: Color(0xFF353535),
            //                         fontSize: 14,
            //                         fontFamily: 'Inter',
            //                         fontWeight: FontWeight.w500,
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            //       const SizedBox(height: ESizes.spaceBtwItemsHeadings),
            //       Column(
            //         children: [
            //           for (final schedule in timetableData[day]!)
            //             ClassSchedule(
            //               period: schedule['period']!,
            //               subject: schedule['subject']!,
            //               professor: schedule['professor']!,
            //               time: schedule['time']!,
            //             ),
            //           // Add more ClassSchedule widgets for each schedule on the day
            //         ],
            //       ),
            //     ],
            //   ),
            // const SizedBox(height: ESizes.spaceBtwItemsHeadings),
 */
            /*
            /// Heading
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: TopHeading(
                text: ETexts.timeTableHeading1,
              ),
            ),

            const SizedBox(
              height: ESizes.spaceBtwItems,
            ),
            */

            /*
            /// Time Table Container
            Column(
              children: [
                const Row(
                  children: [
                    Text(
                      'Monday',
                      style: TextStyle(
                          fontSize: ESizes.fontSizeSm,
                          color: EColors.textPrimaryHeading,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                const SizedBox(height: ESizes.spaceBtwItemsHeadings),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Period',
                                style: TextStyle(
                                  color: Color(0xFF353535),
                                  fontSize: 14,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text('Subject &\nProfessor',
                                style: TextStyle(
                                  color: Color(0xFF353535),
                                  fontSize: 14,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              ),
                              Text(
                                'Class begins',
                                style: TextStyle(
                                  color: Color(0xFF353535),
                                  fontSize: 14,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: ESizes.spaceBtwItemsHeadings),
                Column(
                  children: [
                    Flex(
                      direction: Axis.vertical,
                      children: [
                        Container(
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        // width: 365,
                                        height: 64,
                                        decoration: ShapeDecoration(
                                          color: const Color(0xFFFFEEEE),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '1',
                                                style: TextStyle(
                                                  color: Color(0xFF353535),
                                                  fontSize: 14,
                                                  fontFamily: 'Inter',
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                             Padding(
                                               padding: EdgeInsets.only(top: 8),
                                               child: Column(
                                                 crossAxisAlignment: CrossAxisAlignment.center,

                                                 children: [
                                                   Text.rich(
                                                     TextSpan(
                                                       text: 'Orbital Mechanics',
                                                       style: TextStyle(
                                                         color: Color(0xFF353535),
                                                         fontSize: 14,
                                                         fontFamily: 'Inter',
                                                         fontWeight: FontWeight.w600,
                                                         height: 0,
                                                       ),
                                                     ),
                                                   ),
                                                   Text.rich(
                                                     TextSpan(
                                                       text: 'Prof. Amelia Bennett',
                                                       style: TextStyle(
                                                         color: Color(0xFFE31E24),
                                                         fontSize: 12,
                                                         fontFamily: 'Inter',
                                                         fontWeight: FontWeight.w600,
                                                         height: 0,
                                                       ),
                                                     ),
                                                   ),
                                                 ],
                                               ),
                                             ),
                                              Text(
                                                ' 9:00 AM',
                                                style: TextStyle(
                                                  color: Color(0xFF353535),
                                                  fontSize: 12,
                                                  fontFamily: 'Inter',
                                                  fontWeight: FontWeight.w600,

                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: ESizes.spaceBtwItemsHeadings),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        // width: 365,
                                        height: 64,
                                        decoration: ShapeDecoration(
                                          color: const Color(0xFFFFEEEE),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '1',
                                                style: TextStyle(
                                                  color: Color(0xFF353535),
                                                  fontSize: 14,
                                                  fontFamily: 'Inter',
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),

                                             Padding(
                                               padding: EdgeInsets.only(top: 8),
                                               child: Column(
                                                 crossAxisAlignment: CrossAxisAlignment.center,

                                                 children: [
                                                   Text.rich(
                                                     TextSpan(
                                                       text: 'Orbital Mechanics',
                                                       style: TextStyle(
                                                         color: Color(0xFF353535),
                                                         fontSize: 14,
                                                         fontFamily: 'Inter',
                                                         fontWeight: FontWeight.w600,
                                                         height: 0,
                                                       ),
                                                     ),
                                                   ),
                                                   Text.rich(
                                                     TextSpan(
                                                       text: 'Prof. Amelia Bennett',
                                                       style: TextStyle(
                                                         color: Color(0xFFE31E24),
                                                         fontSize: 12,
                                                         fontFamily: 'Inter',
                                                         fontWeight: FontWeight.w600,
                                                         height: 0,
                                                       ),
                                                     ),
                                                   ),
                                                 ],
                                               ),
                                             ),
                                              Text(
                                                ' 9:00 AM',
                                                style: TextStyle(
                                                  color: Color(0xFF353535),
                                                  fontSize: 12,
                                                  fontFamily: 'Inter',
                                                  fontWeight: FontWeight.w600,

                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
             */
