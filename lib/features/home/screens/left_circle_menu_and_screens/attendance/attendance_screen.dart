import 'package:flutter/material.dart';
import 'package:globalcollegeapp/common/widgets/appbar/appbar.dart';
import 'package:globalcollegeapp/utils/constants/colors.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../../../common/widgets/texts/top_first_heading.dart';
import 'dart:convert';

import 'attendance_widgets/example_attendance_boxes.dart';

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EColors.backgroundColor,
      appBar: const GAppBar(
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
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: Column(
            children: [
              // const SizedBox(height: 16),
              const TopHeading(
                text: 'Every Day Counts:\nYour Attendance\nChronicle',
              ),
              const SizedBox(height: 16),

              /// Calendar
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 8,
                        color: Colors.black12,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CalendarWidget(),
                  ),
                ),
              ),

              /// Color Indication mark
              const ColorIndicationBoxExample(),

              const SizedBox(height: 15,),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    /// Academic day's text
                    Text(
                      "Academic Day's :",
                      style: TextStyle(fontSize: 14, fontFamily: 'Inter'),
                    ),
                    SizedBox(width: 5,),
                    /// Academic days here
                    Text(
                      "22/15",
                      style: TextStyle(fontSize: 14, fontFamily: 'Inter', color: EColors.primary, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10,),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    /// Current Semester attendance text
                    Text(
                      "Your Current Semester Attendance :",
                      style: TextStyle(fontSize: 14, fontFamily: 'Inter'),
                    ),
                    SizedBox(width: 5,),
                    /// Current Semester Attendance Percentage
                    Text(
                      "98.99 %",
                      style: TextStyle(fontSize: 14, fontFamily: 'Inter', color: EColors.primary, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
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
  final DateTime date;

  AttendanceColor({
    required this.type,
    required this.color,
    required this.date,
  });
}

class ColoredDayCell extends StatelessWidget {
  final DateTime day;
  final List<AttendanceColor> events;

  const ColoredDayCell({
    Key? key,
    required this.day,
    required this.events,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isWeekend =
        day.weekday == DateTime.saturday || day.weekday == DateTime.sunday;

    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8),
        color: isWeekend ? const Color(0xFFD6D6D6) : _getBackgroundColor(),
      ),
      child: CircleAvatar(
        backgroundColor: _getBackgroundColor(),
        child: Text(
          day.day.toString(),
          style: TextStyle(color: _getTextColor(), fontSize: 12),
        ),
      ),
    );
  }

  Color _getBackgroundColor() {
    if (events.isNotEmpty) {
      return events.first.color; // Use the color of the first event
    }
    return Colors.transparent;
  }

  Color _getTextColor() {
    return events.isNotEmpty ? Colors.white : Colors.black;
  }
}

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({Key? key}) : super(key: key);

  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  String jsonAttendanceColors = '''
  {
    "2024-01-01": [{"type": "holiday", "color": "amber", "date": "2024-01-01"}],
    "2024-01-06": [{"type": "weekend holiday", "color": "yellow", "date": "2024-01-06"}],
    "2024-01-07": [{"type": "weekend holiday", "color": "yellow", "date": "2024-01-07"}],
    "2024-01-13": [{"type": "present", "color": "blue", "date": "2024-01-13"}],
    "2024-01-14": [{"type": "weekend", "color": "gray", "date": "2024-01-14"}],
    "2024-01-20": [{"type": "absent", "color": "red", "date": "2024-01-20"}],
    "2024-01-21": [{"type": "weekend", "color": "gray", "date": "2024-01-21"}],
    "2024-01-27": [{"type": "leave", "color": "green", "date": "2024-01-27"}],
    "2024-01-28": [{"type": "weekend", "color": "gray", "date": "2024-01-28"}],
    "2024-02-03": [{"type": "present", "color": "blue", "date": "2024-02-03"}],
    "2024-02-04": [{"type": "weekend", "color": "gray", "date": "2024-02-04"}],
    "2024-02-10": [{"type": "absent", "color": "red", "date": "2024-02-10"}],
    "2024-02-11": [{"type": "weekend", "color": "gray", "date": "2024-02-11"}],
    "2024-02-17": [{"type": "leave", "color": "green", "date": "2024-02-17"}],
    "2024-02-18": [{"type": "weekend", "color": "gray", "date": "2024-02-18"}]
  }
  ''';

  Map<DateTime, List<AttendanceColor>> _attendanceColors = {};

  @override
  void initState() {
    super.initState();
    _loadAttendanceColors();
  }

  void _loadAttendanceColors() {
    setState(() {
      _attendanceColors = _processJsonData(jsonAttendanceColors);
    });
  }

  Map<DateTime, List<AttendanceColor>> _processJsonData(String jsonData) {
    Map<String, dynamic> data = json.decode(jsonData);
    Map<DateTime, List<AttendanceColor>> result = {};

    data.forEach((key, value) {
      DateTime date = DateTime.parse(key);
      List<AttendanceColor> colors = _getColorsFromJson(value, date);
      result[date] = colors;
    });

    return result;
  }

  List<AttendanceColor> _getColorsFromJson(
      List<dynamic> jsonList, DateTime date) {
    return jsonList.map((item) {
      return AttendanceColor(
          type: item['type'], color: _getEventColor(item['type']), date: date);
    }).toList();
  }

  Color _getEventColor(String eventType) {
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
        return Colors.purple;
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
      pageAnimationDuration: const Duration(milliseconds: 500),
      pageAnimationCurve: Curves.easeInOut,
      daysOfWeekStyle: const DaysOfWeekStyle(
        weekdayStyle: TextStyle(
            fontSize: 12, fontFamily: 'Inter', color: Colors.black87),
        weekendStyle: TextStyle(
            fontSize: 12, fontFamily: 'Inter', color: Colors.black38),
      ),
      calendarStyle: CalendarStyle(
        canMarkersOverflow: true,
        todayDecoration: BoxDecoration(
          color: Colors.lightBlueAccent,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8),
        ),
        markerDecoration: const BoxDecoration(color: Colors.black12),
        selectedDecoration: BoxDecoration(
          color: Colors.black,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8),
        ),
        weekendDecoration: BoxDecoration(
          color: const Color(0xFFD6D6D6),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      headerStyle: const HeaderStyle(
        titleTextStyle: TextStyle(
          fontSize: 12,
          fontFamily: 'Inter',
        ),
        formatButtonShowsNext: false,
        titleCentered: true,
      ),
      calendarBuilders: CalendarBuilders(
        defaultBuilder: (context, date, _) {
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

/// Only some issue on the Particular events on the dates for colors
//
//
// import 'package:flutter/material.dart';
// import 'package:globalcollegeapp/common/widgets/appbar/appbar.dart';
// import 'package:globalcollegeapp/utils/constants/colors.dart';
// import 'package:table_calendar/table_calendar.dart';
// import '../../../../../common/widgets/texts/top_first_heading.dart';
// import '../../../../../utils/constants/sizes.dart';
// import 'dart:convert';
//
// class AttendanceScreen extends StatelessWidget {
//   const AttendanceScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: EColors.backgroundColor,
//       appBar: const GAppBar(
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
//         physics: const BouncingScrollPhysics(),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(
//             horizontal: 10, vertical: 8
//           ),
//           child: Column(
//             children: [
//
//               /// Title Heading for Books
//               const Row(
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
//               const SizedBox(height: ESizes.spaceBtwItems,),
//
//
//               /// Calendar
//               Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(12),
//                   boxShadow: const [
//                     BoxShadow(
//                       blurRadius: 8,
//                       color: Colors.black12,
//                       spreadRadius: 0
//                     ),
//                   ]
//                 ),
//
//                 child: CalendarWidget(),
//               ),
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
//
// class AttendanceColor {
//   final String type;
//   final Color color;
//   final DateTime date;
//
//   AttendanceColor({required this.type, required this.color, required this.date});
// }
//
// class ColoredDayCell extends StatelessWidget {
//   final DateTime day;
//   final List<AttendanceColor> events;
//   final Color backgroundColor;
//
//   const ColoredDayCell({Key? key, required this.day, required this.events, required this.backgroundColor})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//       ),
//       child: CircleAvatar(
//         backgroundColor: backgroundColor,
//         child: Text(
//           day.day.toString(),
//           style: TextStyle(
//             color: events.isNotEmpty ? Colors.white : Colors.black,
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class CalendarWidget extends StatefulWidget {
//   const CalendarWidget({Key? key}) : super(key: key);
//
//   @override
//   _CalendarWidgetState createState() => _CalendarWidgetState();
// }
//
// class _CalendarWidgetState extends State<CalendarWidget> {
//   CalendarFormat _calendarFormat = CalendarFormat.month;
//   DateTime _focusedDay = DateTime.now();
//   DateTime? _selectedDay;
//
//   String jsonAttendanceColors = '''
//   {
//     "2024-01-01": [{"type": "holiday", "color": "holiday", "date": "2024-01-01"}],
//     "2024-01-06": [{"type": "weekend holiday", "color": "weekend holiday", "date": "2024-01-06"}],
//     "2024-01-13": [{"type": "present", "color": "present", "date": "2024-01-13"}],
//     "2024-01-20": [{"type": "absent", "color": "absent", "date": "2024-01-20"}],
//     "2024-01-27": [{"type": "leave", "color": "leave", "date": "2024-01-27"}],
//     "2024-02-03": [{"type": "present", "color": "present", "date": "2024-02-03"}],
//     "2024-02-10": [{"type": "absent", "color": "absent", "date": "2024-02-10"}],
//     "2024-02-17": [{"type": "leave", "color": "leave", "date": "2024-02-17"}]
//   }
// ''';
//
//   Map<DateTime, List<AttendanceColor>> _attendanceColors = {};
//
//   @override
//   void initState() {
//     super.initState();
//     _attendanceColors = _processJsonData(jsonAttendanceColors);
//     print('_attendanceColors: $_attendanceColors');
//   }
//
//   // Process JSON data to convert it into a map of DateTime to List of AttendanceColor
//   Map<DateTime, List<AttendanceColor>> _processJsonData(String jsonData) {
//     Map<String, dynamic> data = json.decode(jsonData);
//     Map<DateTime, List<AttendanceColor>> result = {};
//
//     data.forEach((key, value) {
//       DateTime date = DateTime.parse(key);
//       List<AttendanceColor> colors = _getColorsFromJson(value, date);
//       result[date] = colors;
//     });
//
//     return result;
//   }
//
//   // Convert a list of dynamic data from JSON to a list of AttendanceColor
//   List<AttendanceColor> _getColorsFromJson(List<dynamic> jsonList, DateTime date) {
//     return jsonList.map((item) {
//       return AttendanceColor(type: item['type'], color: getEventColor(item['type']), date: date);
//     }).toList();
//   }
//
//   // Map the event type to a specific color
//   Color getEventColor(String eventType) {
//     switch (eventType.toLowerCase()) {
//       case 'present':
//         return Colors.blue;
//       case 'absent':
//         return Colors.red;
//       case 'holiday':
//         return Colors.amber;
//       case 'weekend holiday':
//         return Colors.yellow;
//       case 'leave':
//         return Colors.green;
//       default:
//         return Colors.purple;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return TableCalendar<AttendanceColor>(
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
//           color: Colors.transparent,
//           shape: BoxShape.rectangle,
//           borderRadius: BorderRadius.circular(8),
//         ),
//         selectedDecoration: BoxDecoration(
//           color: Colors.transparent,
//           shape: BoxShape.rectangle,
//           borderRadius: BorderRadius.circular(8),
//         ),
//         weekendDecoration: BoxDecoration(
//           color: const Color(0xFFD6D6D6),
//           shape: BoxShape.rectangle,
//           borderRadius: BorderRadius.circular(8),
//         ),
//       ),
//       headerStyle: const HeaderStyle(
//         formatButtonShowsNext: false,
//         titleCentered: true,
//       ),
//       calendarBuilders: CalendarBuilders(
//         defaultBuilder: (context, date, _) {
//           List<AttendanceColor> events = _attendanceColors[date] ?? [];
//           Color backgroundColor = events.isNotEmpty ? events.first.color : Colors.transparent;
//           print('Date: $date, Background Color: $backgroundColor');
//           return ColoredDayCell(day: date, events: events, backgroundColor: backgroundColor);
//         },
//       ),
//     );
//   }
//
//   // Return events for a specific day
//   List<AttendanceColor> _getEventsForDay(DateTime day) {
//     List<AttendanceColor> events = _attendanceColors[day] ?? [];
//     print('Events for $day: $events');
//     return events;
//   }
// }
//
//
//
