
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
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
              SizedBox(
                  width: 400,
                  height: 450,
                  child: CalendarPage()),

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




class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  Map<DateTime, EventWrapper> attendanceData = {
    DateTime(2024, 2, 1): EventWrapper('absent'),
    DateTime(2024, 2, 3): EventWrapper('present'),
    DateTime(2024, 2, 5): EventWrapper('present'),
    DateTime(2024, 2, 10): EventWrapper('leave'),
    DateTime(2024, 2, 15): EventWrapper('holiday'),
    DateTime(2024, 2, 20): EventWrapper('weekend_holiday'),
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            blurRadius: 8,
            color: Colors.black12,
          ),
        ],
      ),
      child: CalendarCarousel<EventWrapper>(
        onDayPressed: (DateTime date, List<EventWrapper> events) {
          // Handle day pressed
          print(date);
        },
        weekendTextStyle: const TextStyle(color: Colors.grey), // Light grey color for weekends
        headerTextStyle: const TextStyle(color: Colors.grey), // Dark grey text color for weekdays
        thisMonthDayBorderColor: Colors.grey,
        customDayBuilder: (
            bool isSelectable,
            int index,
            bool isSelectedDay,
            bool isToday,
            bool isPrevMonthDay,
            TextStyle textStyle,
            bool isNextMonthDay,
            bool isThisMonthDay,
            DateTime day,
            ) {
          Color cellColor = EColors.calenderBoxColor;
          Color textColor = Colors.black;

          if (isToday) {
            cellColor = Colors.pink.shade50; // Rounded container for present day
          } else if (attendanceData.containsKey(day)) {
            switch (attendanceData[day]!.type) {
              case 'absent':
                cellColor = Colors.red.shade200;
                break;
              case 'present':
                cellColor = Colors.cyan.shade200;
                break;
              case 'leave':
                cellColor = Colors.green.shade200;
                break;
              case 'holiday':
                cellColor = Colors.orange.shade200;
                break;
              case 'weekend_holiday':
                cellColor = Colors.yellow.shade200;
                break;
            }
          }

          // Adjust text color for weekdays
          if (!isThisMonthDay) {
            textColor = Colors.grey;
          } else if (day.weekday == DateTime.sunday || day.weekday == DateTime.saturday) {
            textColor = Colors.grey; // Light grey color for Sundays and Saturdays
          }

          return Center(
            child: Container(
              decoration: BoxDecoration(
                color: cellColor,
                borderRadius: BorderRadius.circular(isToday ? 30 : 8), // Rounded for today
              ),
              child: Center(
                child: Text(
                  '${day.day}',
                  style: TextStyle(color: textColor),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class EventWrapper implements EventInterface {
  final String type;

  EventWrapper(this.type);

  @override
  String toString() {
    return type;
  }

  @override
  DateTime getDate() {
    // TODO: implement getDate
    throw UnimplementedError();
  }

  @override
  String? getDescription() {
    // TODO: implement getDescription
    throw UnimplementedError();
  }

  @override
  Widget? getDot() {
    // TODO: implement getDot
    throw UnimplementedError();
  }

  @override
  Widget? getIcon() {
    // TODO: implement getIcon
    throw UnimplementedError();
  }

  @override
  int? getId() {
    // TODO: implement getId
    throw UnimplementedError();
  }

  @override
  String? getLocation() {
    // TODO: implement getLocation
    throw UnimplementedError();
  }

  @override
  String? getTitle() {
    // TODO: implement getTitle
    throw UnimplementedError();
  }
}


