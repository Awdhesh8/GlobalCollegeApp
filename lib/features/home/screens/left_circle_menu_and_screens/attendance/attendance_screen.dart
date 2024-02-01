// import 'package:flutter/material.dart';
// import 'package:globalcollegeapp/common/widgets/appbar/appbar.dart';
// import 'package:globalcollegeapp/utils/constants/colors.dart';
//
// import '../../../../../common/widgets/texts/top_first_heading.dart';
// import '../../../../../utils/constants/sizes.dart';
//
// class AttendanceScreen extends StatelessWidget {
//   const AttendanceScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       backgroundColor: EColors.backgroundColor,
//       appBar: GAppBar(
//         centerTitle: true,
//         showBackArrow: true,
//         backgroundColor: Colors.transparent,
//         title: Text(
//           'Attendance',
//           style: TextStyle(
//             color: EColors.textColorPrimary1,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//
//       ///
//       body: SingleChildScrollView(
//         physics: BouncingScrollPhysics(),
//         child: Padding(
//           padding: EdgeInsets.symmetric(
//             horizontal: 10, vertical: 8
//           ),
//           child: Column(
//             children: [
//
//               /// Title Heading for Books
//               Row(
//                 children: [
//                   Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 12),
//                       child: TopHeading(
//                         text:
//                         'Every Day Counts:\nYour Attendance\nChronicle',
//                       ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: ESizes.spaceBtwItems,),
//
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// ///  Presents (No color)
// ///  Absents ( Color(0xFFFF0000),)
// ///  Holidays (Color(0xFFFFD580),)
// ///  weekend Holidays ( Color(0xFFFFFF00),)
// ///  Academic Day's
// ///  Your Current Semester Attendance

import 'package:flutter/material.dart';
import 'package:globalcollegeapp/common/widgets/appbar/appbar.dart';
import 'package:globalcollegeapp/utils/constants/colors.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../../../common/widgets/texts/top_first_heading.dart';
import '../../../../../utils/constants/sizes.dart';
import 'dart:convert';

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EColors.backgroundColor,
      appBar: GAppBar(
        centerTitle: true,
        showBackArrow: true,
        backgroundColor: Colors.transparent,
        title: Text(
          'Attendance',
          style: TextStyle(
            color: EColors.textColorPrimary1,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      ///
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10, vertical: 8
          ),
          child: Column(
            children: [

              /// Title Heading for Books
              Row(
                children: [
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: TopHeading(
                        text:
                        'Every Day Counts:\nYour Attendance\nChronicle',
                      ),
                  ),
                ],
              ),
              SizedBox(height: ESizes.spaceBtwItems,),


              /// Calendar
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 8,
                      color: Colors.black12,
                      spreadRadius: 0
                    ),
                  ]
                ),

                child: CalendarWidget(),
              ),

            ],
          ),
        ),
      ),
    );
  }
}




class AttendanceColor {
  final String type;
  final Color color;

  AttendanceColor({required this.type, required this.color});
}

class ColoredDayCell extends StatelessWidget {
  final DateTime day;
  final List<AttendanceColor> events;

  ColoredDayCell({required this.day, required this.events});

  @override
  Widget build(BuildContext context) {
    Color getEventColor(String eventType) {
      switch (eventType.toLowerCase()) {
        case 'present':
          return Colors.blue;
        case 'absent':
          return Colors.red;
        case 'holiday':
          return Colors.amber;
        case 'weekend holiday':
          return Colors.yellow;
        case 'leave':
          return Colors.green;
        default:
          return Colors.transparent;
      }
    }

    Color backgroundColor =
    events.isNotEmpty ? getEventColor(events.first.type) : Colors.transparent;

    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor,
      ),
      child: Center(
        child: Text(
          day.day.toString(),
          style: TextStyle(
            color: events.isNotEmpty ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}

class CalendarWidget extends StatefulWidget {
  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  String jsonAttendanceColors = '''
    {
      "2024-01-01": [{"type": "Holiday", "color": "holiday"}],
      "2024-01-06": [{"type": "Weekend Holiday", "color": "weekend holiday"}],
      "2024-01-13": [{"type": "Present", "color": "present"}],
      "2024-01-20": [{"type": "Absent", "color": "absent"}],
      "2024-01-27": [{"type": "Leave", "color": "leave"}],
      "2024-02-03": [{"type": "Present", "color": "present"}],
      "2024-02-10": [{"type": "Absent", "color": "absent"}],
      "2024-02-17": [{"type": "Leave", "color": "leave"}]
    }
  ''';

  Map<DateTime, List<AttendanceColor>> _attendanceColors = {};

  @override
  void initState() {
    super.initState();
    _attendanceColors = _processJsonData(jsonAttendanceColors);
  }

  Map<DateTime, List<AttendanceColor>> _processJsonData(String jsonData) {
    Map<String, dynamic> data = json.decode(jsonData);
    Map<DateTime, List<AttendanceColor>> result = {};

    data.forEach((key, value) {
      DateTime date = DateTime.parse(key);
      List<AttendanceColor> colors = _getColorsFromJson(value);
      result[date] = colors;
    });

    return result;
  }

  List<AttendanceColor> _getColorsFromJson(List<dynamic> jsonList) {
    return jsonList
        .map((item) =>
        AttendanceColor(type: item['type'], color: _getColorFromString(item['color'])))
        .toList();
  }

  Color _getColorFromString(String colorName) {
    switch (colorName.toLowerCase()) {
      case 'present':
        return Colors.blue;
      case 'absent':
        return Colors.red;
      case 'holiday':
        return Colors.amber;
      case 'weekend holiday':
        return Colors.yellow;
      case 'leave':
        return Colors.green;
      default:
        return Colors.transparent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar<AttendanceColor>(
      calendarFormat: _calendarFormat,
      focusedDay: _focusedDay,
      firstDay: DateTime(2000),
      lastDay: DateTime(2050),
      eventLoader: _getEventsForDay,
      onFormatChanged: (format) {
        setState(() {
          _calendarFormat = format;
        });
      },
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _selectedDay = selectedDay;
          _focusedDay = focusedDay;
        });
      },
      calendarStyle: CalendarStyle(
        todayDecoration: BoxDecoration(
            color: Colors.lightBlueAccent,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(8)),
        selectedDecoration: BoxDecoration(
            color: Colors.green,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(8)),
        weekendDecoration: BoxDecoration(
            color: Color(0xFFD6D6D6),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(8)),
      ),
      headerStyle: HeaderStyle(
        formatButtonShowsNext: false,
        titleCentered: true,
      ),
      calendarBuilders: CalendarBuilders(
        defaultBuilder: (context, date, _) {
          // Check if there are events for the date
          List<AttendanceColor> events = _attendanceColors[date] ?? [];
          return ColoredDayCell(day: date, events: events);
        },
      ),
    );
  }

  List<AttendanceColor> _getEventsForDay(DateTime day) {
    return _attendanceColors[day] ?? [];
  }
}



/*
class AttendanceColor {
  final String type;
  final Color color;

  AttendanceColor({required this.type, required this.color});
}

class CalendarWidget extends StatefulWidget {
  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  String jsonAttendanceColors = '''
    {
      "2024-01-01": [{"type": "Holiday", "color": 4294944000}],
      "2024-01-06": [{"type": "Weekend Holiday", "color": 4294944000}],
      "2024-01-13": [{"type": "Present", "color": 4278190335}],
      "2024-01-20": [{"type": "Absent", "color": 4294901760}],
      "2024-01-27": [{"type": "Leave", "color": 4278255360}],
      "2024-02-03": [{"type": "Present", "color": 0xFF0000FF}],
      "2024-02-10": [{"type": "Absent", "color": 4294901760}],
      "2024-02-17": [{"type": "Leave", "color": 4278255360}]
    }
  ''';

  Map<DateTime, List<AttendanceColor>> _attendanceColors = {};

  @override
  void initState() {
    super.initState();
    _attendanceColors = _processJsonData(jsonAttendanceColors);
  }

  Map<DateTime, List<AttendanceColor>> _processJsonData(String jsonData) {
    Map<String, dynamic> data = json.decode(jsonData);
    Map<DateTime, List<AttendanceColor>> result = {};

    data.forEach((key, value) {
      DateTime date = DateTime.parse(key);
      List<AttendanceColor> colors = _getColorsFromJson(value);
      result[date] = colors;
    });

    return result;
  }

  List<AttendanceColor> _getColorsFromJson(List<dynamic> jsonList) {
    return jsonList
        .map((item) =>
        AttendanceColor(type: item['type'], color: Color(item['color'])))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar<AttendanceColor>(
      calendarFormat: _calendarFormat,
      focusedDay: _focusedDay,
      firstDay: DateTime(2000),
      lastDay: DateTime(2050),
      eventLoader: _getEventsForDay,
      onFormatChanged: (format) {
        setState(() {
          _calendarFormat = format;
        });
      },
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _selectedDay = selectedDay;
          _focusedDay = focusedDay;
        });
      },
      calendarStyle: CalendarStyle(
        todayDecoration: BoxDecoration(
            color: Colors.lightBlueAccent,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(8)),
        selectedDecoration: BoxDecoration(
            color: Colors.green,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(8)),
        weekendDecoration: BoxDecoration(
            color: Color(0xFFD6D6D6),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(8)),
      ),
      headerStyle: HeaderStyle(
        formatButtonShowsNext: false,
        titleCentered: true,
      ),
      calendarBuilders: CalendarBuilders(
        defaultBuilder: (context, date, _) {
          // Check if there are events for the date
          List<AttendanceColor> events = _attendanceColors[date] ?? [];
          return ColoredDayCell(day: date, events: events);
        },
      ),
    );
  }

  List<AttendanceColor> _getEventsForDay(DateTime day) {
    return _attendanceColors[day] ?? [];
  }
}
class ColoredDayCell extends StatelessWidget {
  final DateTime day;
  final List<AttendanceColor> events;

  ColoredDayCell({required this.day, required this.events});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: events.isNotEmpty ? events.first.color : Colors.transparent,
      ),
      child: Center(
        child: Text(
          day.day.toString(),
          style: TextStyle(
            color: events.isNotEmpty ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}

 */



// class CalendarWidget extends StatefulWidget {
//   @override
//   _CalendarWidgetState createState() => _CalendarWidgetState();
// }
//
// class _CalendarWidgetState extends State<CalendarWidget> {
//   CalendarFormat _calendarFormat = CalendarFormat.month;
//   DateTime _focusedDay = DateTime.now();
//   DateTime? _selectedDay;
//
//   Map<DateTime, List<Map<String, String>>> _events = {
//     DateTime(2024, 1, 1): [
//       {'type': 'Holiday', 'color': '#FFA500'},
//     ],
//     DateTime(2024, 1, 6): [
//       {'type': 'Weekend Holiday', 'color': '#FFA500'},
//     ],
//     DateTime(2024, 1, 13): [
//       {'type': 'Present', 'color': '#0000FF'},
//     ],
//     DateTime(2024, 1, 20): [
//       {'type': 'Absent', 'color': '#FF0000'},
//     ],
//     DateTime(2024, 1, 27): [
//       {'type': 'Leave', 'color': '#008000'},
//     ],
//     DateTime(2024, 2, 3): [
//       {'type': 'Present', 'color': '#0000FF'},
//     ],
//     DateTime(2024, 2, 10): [
//       {'type': 'Absent', 'color': '#FF0000'},
//     ],
//     DateTime(2024, 2, 17): [
//       {'type': 'Leave', 'color': '#008000'},
//     ],
//   };
//
//   @override
//   Widget build(BuildContext context) {
//     return TableCalendar<Map<String, String>>(
//       calendarFormat: _calendarFormat,
//       focusedDay: _focusedDay,
//       firstDay: DateTime(2000),
//       lastDay: DateTime(2050),
//       eventLoader: _getEventsForDay,
//       onFormatChanged: (format) {
//         setState(() {
//           _calendarFormat = format;
//         });
//       },
//       onDaySelected: (selectedDay, focusedDay) {
//         setState(() {
//           _selectedDay = selectedDay;
//           _focusedDay = focusedDay;
//         });
//       },
//       calendarStyle: CalendarStyle(
//         todayDecoration: BoxDecoration(
//           color: Colors.lightBlueAccent,
//           shape: BoxShape.rectangle,
//           borderRadius: BorderRadius.circular(8)
//         ),
//         selectedDecoration: BoxDecoration(
//           color: Colors.green,
//             shape: BoxShape.rectangle,
//             borderRadius: BorderRadius.circular(8)
//         ),
//         weekendDecoration: BoxDecoration(
//            color: Color(0xFFD6D6D6),
//             shape: BoxShape.rectangle,
//             borderRadius: BorderRadius.circular(8)
//         ),
//       ),
//       headerStyle: HeaderStyle(
//         formatButtonShowsNext: false,
//         titleCentered: true,
//       ),
//     );
//   }
//
//   List<Map<String, String>> _getEventsForDay(DateTime day) {
//     return _events[day] ?? [];
//   }
// }
//






/*
import 'package:flutter/material.dart';
import 'package:globalcollegeapp/common/widgets/appbar/appbar.dart';
import 'package:globalcollegeapp/utils/constants/colors.dart';
import 'package:globalcollegeapp/common/widgets/texts/top_first_heading.dart';
import 'package:table_calendar/table_calendar.dart';
import 'dart:convert'; // for json decoding

import '../../../../../utils/constants/sizes.dart';

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});

  // Dummy JSON data representing student activities for each date
  final String studentActivitiesJson = '''
    {
      "2024-02-01": "Present",
      "2024-02-05": "Absent",
      "2024-02-10": "Holiday",
      "2024-02-15": "Weekend Holiday",
      "2024-02-20": "Leave"
    }
  ''';

  @override
  Widget build(BuildContext context) {
    // Convert the JSON data to a Map
    final Map<String, dynamic> studentActivities = jsonDecode(studentActivitiesJson);

    return Scaffold(
      backgroundColor: Colors.white, // Set background color to white
      appBar: GAppBar(
        centerTitle: true,
        showBackArrow: true,
        backgroundColor: Colors.transparent,
        title: Text(
          'Attendance',
          style: TextStyle(
            color: EColors.textColorPrimary1,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: Column(
            children: [

              /// Title Heading for Calendar
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: TopHeading(
                      text: 'Every Day Counts:\nYour Attendance\nChronicle',
                    ),
                  ),
                ],
              ),
              SizedBox(height: ESizes.spaceBtwItems),

              /// Add the TableCalendar widget
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x26000000),
                        blurRadius: 10.90,
                        offset: Offset(0, 0),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: TableCalendar<String>(
                    firstDay: DateTime.utc(2024, 1, 1),
                    lastDay: DateTime.utc(2024, 12, 31),
                    focusedDay: DateTime.now(),
                    calendarFormat: CalendarFormat.month,
                    headerStyle: HeaderStyle(
                      formatButtonVisible: false,
                    ),
                    onDaySelected: (selectedDay, focusedDay) {
                      // Handle day selection if needed
                    },
                    calendarBuilders: CalendarBuilders(
                      markerBuilder: (context, date, events) {
                        // Customize markers based on student activities
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: _getActivityColor(studentActivities[date.toString()] ?? ''),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),

              SizedBox(height: ESizes.spaceBtwItems),

              // Display student activities based on selected date
              for (var entry in studentActivities.entries)
                Container(
                  decoration: BoxDecoration(
                    color: _getActivityColor(entry.value),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: EdgeInsets.all(8.0),
                  margin: EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(entry.key),
                      Text(entry.value),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper function to determine the background color based on activity
  Color _getActivityColor(String activity) {
    switch (activity.toLowerCase()) {
      case 'present':
        return Colors.transparent;
      case 'absent':
        return Colors.red;
      case 'holiday':
        return Colors.amber;
      case 'weekend holiday':
        return Colors.yellow;
      case 'leave':
        return Colors.green;
      default:
        return Colors.transparent;
    }
  }
}
*/


/// Calendar data
/*
    {"date": "2024-02-01", "status": ["Present"]},
    {"date": "2024-02-02", "status": ["Absent"]},
    {"date": "2024-02-03", "status": ["Present"]},
    {"date": "2024-02-04", "status": ["Present"]},
    {"date": "2024-02-05", "status": ["Absent"]},
    {"date": "2024-02-06", "status": ["Present"]},
    {"date": "2024-02-07", "status": ["Absent"]},
    {"date": "2024-02-08", "status": ["Present"]},
    {"date": "2024-02-09", "status": ["Present"]},
    {"date": "2024-02-10", "status": ["Absent"]},
    {"date": "2024-02-11", "status": ["Present"]},
    {"date": "2024-02-12", "status": ["Weekend Holiday"]},
    {"date": "2024-02-13", "status": ["Weekend Holiday"]},
    {"date": "2024-02-14", "status": ["Present"]},
    // Add more data as needed
 */
