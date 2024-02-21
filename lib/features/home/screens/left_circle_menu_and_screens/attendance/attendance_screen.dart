import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:globalcollegeapp/common/widgets/appbar/appbar.dart';
import 'package:globalcollegeapp/utils/constants/colors.dart';
import 'package:intl/intl.dart';
import '../../../../../common/widgets/texts/top_first_heading.dart';
import 'attendance_controller/attendance_controller.dart';
import 'attendance_widgets/example_attendance_boxes.dart';


class AttendanceScreen extends StatelessWidget {
  final AttendanceController controller = Get.put(AttendanceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(      backgroundColor: EColors.backgroundColor,
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
              const TopHeading(
                text: 'Every Day Counts:\nYour Attendance\nChronicle',
              ),
              const SizedBox(height: 16),

              // CalendarWidget added here
              // CalendarWidget(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                child: Container(
                  // height: 300,
                  // width: 300,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                              blurRadius: 8,
                              color: Colors.black12
                          )
                        ]
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      // child: MyCalendar(),
                      child: CalendarPage(),
                    )),
              ),

              const ColorIndicationBoxExample(),
              const SizedBox(height: 15),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Text(
                      "Academic Day's :",
                      style: TextStyle(fontSize: 14, fontFamily: 'Inter'),
                    ),
                    SizedBox(width: 5),
                    Text(
                      "22/15",
                      style: TextStyle(fontSize: 14, fontFamily: 'Inter', color: EColors.primary, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Text(
                      "Your Current Semester Attendance :",
                      style: TextStyle(fontSize: 14, fontFamily: 'Inter'),
                    ),
                    SizedBox(width: 5),
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

class CalendarEvent {
  final String eventName;
  final DateTime eventDate;

  CalendarEvent({
    required this.eventName,
    required this.eventDate,
  });
}

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  late DateTime _currentMonth;
  final PageController _pageController = PageController(initialPage: DateTime.now().month - 1);

  // Sample JSON data representing events
  final String jsonData = '''
    [
      {"eventName": "P", "eventDate": "2024-02-01"},
      {"eventName": "P", "eventDate": "2024-01-01"},
      {"eventName": "P", "eventDate": "2024-02-02"},
      {"eventName": "P", "eventDate": "2024-02-03"},
      {"eventName": "P", "eventDate": "2024-04-03"},
      {"eventName": "A", "eventDate": "2024-02-04"},
      {"eventName": "P", "eventDate": "2024-02-05"},
      {"eventName": "A", "eventDate": "2024-02-06"},
      {"eventName": "L", "eventDate": "2024-02-13"},
      {"eventName": "H", "eventDate": "2024-02-15"},
      {"eventName": "WH", "eventDate": "2024-02-20"}
    ]
  ''';


  List<CalendarEvent> _events = [];

  void _loadEventsFromJson() {
    final List<dynamic> jsonDataList = jsonDecode(jsonData);
    _events = jsonDataList.map((data) {
      return CalendarEvent(
        eventName: data['eventName'],
        eventDate: DateTime.parse(data['eventDate']),
      );
    }).toList();
  }

  Color getEventBackgroundColor(String eventName) {
    switch (eventName) {
      case 'P':
        return Colors.cyan.shade100;
      case 'A':
        return Colors.red.shade200;
      case 'L':
        return Colors.green.shade500;
      case 'H':
        return Colors.orange.shade300;
      case 'WH':
        return Colors.yellow.shade300;
      default:
        return Colors.transparent;
    }
  }

  Widget buildCell(DateTime date) {
    List<CalendarEvent> eventsOnDate = _events
        .where((event) => event.eventDate.isAtSameMomentAs(DateTime(date.year, date.month, date.day)))
        .toList();

    Color cellColor = Colors.transparent;

    if (eventsOnDate.isNotEmpty) {
      cellColor = getEventBackgroundColor(eventsOnDate.first.eventName);
    }

    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8),
          color: cellColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              date.day.toString(),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              DateFormat('EEE').format(date), // Display the day of the week
              style: const TextStyle(
                color: Colors.black,
                fontSize: 8,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w200,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMonth(DateTime firstDayOfMonth) {
    List<Widget> dayWidgets = [];
    DateTime currentDate = DateTime(firstDayOfMonth.year, firstDayOfMonth.month, 1);
    int daysInMonth = DateTime(firstDayOfMonth.year, firstDayOfMonth.month + 1, 0).day;

    while (currentDate.month == firstDayOfMonth.month) {
      dayWidgets.add(buildCell(currentDate));
      currentDate = currentDate.add(const Duration(days: 1));
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
      ),
      itemBuilder: (BuildContext context, int index) {
        return dayWidgets[index];
      },
      itemCount: dayWidgets.length,
    );
  }

  Widget buildMonthHeader(String monthName) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4, left: 4, right: 4),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue.shade50,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Text(
            monthName,
            style: const TextStyle(
                color: Colors.black45,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                letterSpacing: 5
            ),
          ),
        ),
      ),
    );
  }

  Widget buildNavigationButtons() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4, left: 4, right: 4, top: 8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue.shade50,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                _pageController.previousPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
              icon: Icon(Icons.arrow_back, color: Colors.black54,),
            ),
            Text(
              DateFormat('MMMM yyyy').format(_currentMonth),
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, fontFamily: 'Inter'),
            ),
            IconButton(
              onPressed: () {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
              icon: Icon(Icons.arrow_forward, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _currentMonth = DateTime.now();
    _loadEventsFromJson();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      child: Column(
        children: [
          buildNavigationButtons(),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              physics: const BouncingScrollPhysics(),
              itemCount: 12,
              onPageChanged: (int monthIndex) {
                setState(() {
                  _currentMonth = DateTime(_currentMonth.year, monthIndex + 1, 1);
                });
              },
              itemBuilder: (BuildContext context, int monthIndex) {
                final DateTime firstDayOfMonth = DateTime(_currentMonth.year, monthIndex + 1, 1);

                return Container(
                  margin: const EdgeInsets.all(6),
                  child: Column(
                    children: [
                      // buildMonthHeader(DateFormat('MMMM').format(firstDayOfMonth)),
                      buildMonth(firstDayOfMonth),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}




/*
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:globalcollegeapp/common/widgets/appbar/appbar.dart';
import 'package:globalcollegeapp/utils/constants/colors.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_clean_calendar/controllers/clean_calendar_controller.dart';
import 'package:scrollable_clean_calendar/models/day_values_model.dart';
import 'package:scrollable_clean_calendar/scrollable_clean_calendar.dart';
import '../../../../../common/widgets/texts/top_first_heading.dart';
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
              const TopHeading(
                text: 'Every Day Counts:\nYour Attendance\nChronicle',
              ),
              const SizedBox(height: 16),

              // CalendarWidget added here
              // CalendarWidget(),
              Container(
                // height: 300,
                // width: 300,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        const BoxShadow(
                            blurRadius: 8,
                            color: Colors.black26
                        )
                      ]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    // child: MyCalendar(),
                     child: CalendarPage(),
                  )),

              const ColorIndicationBoxExample(),
              const SizedBox(height: 15),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Text(
                      "Academic Day's :",
                      style: TextStyle(fontSize: 14, fontFamily: 'Inter'),
                    ),
                    SizedBox(width: 5),
                    Text(
                      "22/15",
                      style: TextStyle(fontSize: 14, fontFamily: 'Inter', color: EColors.primary, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Text(
                      "Your Current Semester Attendance :",
                      style: TextStyle(fontSize: 14, fontFamily: 'Inter'),
                    ),
                    SizedBox(width: 5),
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

class CalendarEvent {
  final String eventName;
  final DateTime eventDate;

  CalendarEvent({
    required this.eventName,
    required this.eventDate,
  });
}

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  late DateTime _currentMonth;
  final PageController _pageController = PageController(initialPage: DateTime.now().month - 1);


  // Sample JSON data representing events
  final String jsonData = '''
    [
      {"eventName": "P", "eventDate": "2024-02-01"},
      {"eventName": "P", "eventDate": "2024-02-02"},
      {"eventName": "P", "eventDate": "2024-02-03"},
      {"eventName": "A", "eventDate": "2024-02-04"},
      {"eventName": "P", "eventDate": "2024-02-05"},
      {"eventName": "A", "eventDate": "2024-02-06"},
      {"eventName": "L", "eventDate": "2024-02-13"},
      {"eventName": "H", "eventDate": "2024-02-15"},
      {"eventName": "WH", "eventDate": "2024-02-20"}
    ]
  ''';

  List<CalendarEvent> _events = [];

  void _loadEventsFromJson() {
    final List<dynamic> jsonDataList = jsonDecode(jsonData);
    _events = jsonDataList.map((data) {
      return CalendarEvent(
        eventName: data['eventName'],
        eventDate: DateTime.parse(data['eventDate']),
      );
    }).toList();
  }

  Color getEventBackgroundColor(String eventName) {
    switch (eventName) {
      case 'P':
        return Colors.cyan.shade100;
      case 'A':
        return Colors.red.shade200;
      case 'L':
        return Colors.green.shade500;
      case 'H':
        return Colors.orange.shade300;
      case 'WH':
        return Colors.yellow.shade300;
      default:
        return Colors.transparent;
    }
  }

  Widget buildCell(DateTime date) {
    List<CalendarEvent> eventsOnDate = _events
        .where((event) => event.eventDate.isAtSameMomentAs(DateTime(date.year, date.month, date.day)))
        .toList();

    Color cellColor = Colors.transparent;

    if (eventsOnDate.isNotEmpty) {
      cellColor = getEventBackgroundColor(eventsOnDate.first.eventName);
    }

    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8),
          color: cellColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              date.day.toString(),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              DateFormat('EEE').format(date), // Display the day of the week
              style: const TextStyle(
                color: Colors.black,
                fontSize: 8,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w200,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMonth(DateTime firstDayOfMonth) {
    List<Widget> dayWidgets = [];
    DateTime currentDate = DateTime(firstDayOfMonth.year, firstDayOfMonth.month, 1);
    int daysInMonth = DateTime(firstDayOfMonth.year, firstDayOfMonth.month + 1, 0).day;

    while (currentDate.month == firstDayOfMonth.month) {
      dayWidgets.add(buildCell(currentDate));
      currentDate = currentDate.add(const Duration(days: 1));
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
      ),
      itemBuilder: (BuildContext context, int index) {
        return dayWidgets[index];
      },
      itemCount: dayWidgets.length,
    );
  }

  Widget buildMonthHeader(String monthName) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4, left: 4, right: 4),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue.shade50,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Text(
            monthName,
            style: const TextStyle(
                color: Colors.black45,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                letterSpacing: 5
            ),
          ),
        ),
      ),
    );
  }

  Widget buildNavigationButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          onPressed: () {
            _pageController.previousPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
          icon: Icon(Icons.arrow_back),
        ),
        Text(
          DateFormat('MMMM yyyy').format(_currentMonth),
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        IconButton(
          onPressed: () {
            _pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
          icon: Icon(Icons.arrow_forward),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    _currentMonth = DateTime.now();
    _loadEventsFromJson();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 340,
      child: Column(
        children: [
          buildNavigationButtons(),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              physics: const BouncingScrollPhysics(),
              itemCount: 12,
              onPageChanged: (int monthIndex) {
                setState(() {
                  _currentMonth = DateTime(_currentMonth.year, monthIndex + 1, 1);
                });
              },
              itemBuilder: (BuildContext context, int monthIndex) {
                final DateTime firstDayOfMonth = DateTime(_currentMonth.year, monthIndex + 1, 1);

                return Container(
                  margin: const EdgeInsets.all(6),
                  child: Column(
                    children: [
                      buildMonthHeader(DateFormat('MMMM').format(firstDayOfMonth)),
                      buildMonth(firstDayOfMonth),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
*/



///
/*
import 'dart:convert';
import 'package:cell_calendar/cell_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:globalcollegeapp/common/widgets/appbar/appbar.dart';
import 'package:globalcollegeapp/utils/constants/colors.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../../../common/widgets/texts/top_first_heading.dart';
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
              const TopHeading(
                text: 'Every Day Counts:\nYour Attendance\nChronicle',
              ),
              const SizedBox(height: 16),

              // CalendarWidget added here
              // CalendarWidget(),
              Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      const BoxShadow(
                        blurRadius: 8,
                        color: Colors.black26
                      )
                    ]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CalendarPage(),
                  )),

              const ColorIndicationBoxExample(),
              const SizedBox(height: 15),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Text(
                      "Academic Day's :",
                      style: TextStyle(fontSize: 14, fontFamily: 'Inter'),
                    ),
                    SizedBox(width: 5),
                    Text(
                      "22/15",
                      style: TextStyle(fontSize: 14, fontFamily: 'Inter', color: EColors.primary, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Text(
                      "Your Current Semester Attendance :",
                      style: TextStyle(fontSize: 14, fontFamily: 'Inter'),
                    ),
                    SizedBox(width: 5),
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


// class CalendarPage extends StatefulWidget {
//   @override
//   _CalendarPageState createState() => _CalendarPageState();
// }

class CalendarEvent {
  final String eventName;
  final DateTime eventDate;

  CalendarEvent({
    required this.eventName,
    required this.eventDate,
  });
}

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  late DateTime _currentMonth;

  // Sample JSON data representing events
  final String jsonData = '''
    [
      {"eventName": "P", "eventDate": "2024-02-01"},
      {"eventName": "P", "eventDate": "2024-02-02"},
      {"eventName": "P", "eventDate": "2024-02-03"},
      {"eventName": "A", "eventDate": "2024-02-04"},
      {"eventName": "P", "eventDate": "2024-02-05"},
      {"eventName": "A", "eventDate": "2024-02-06"},
      {"eventName": "L", "eventDate": "2024-02-13"},
      {"eventName": "H", "eventDate": "2024-02-15"},
      {"eventName": "WH", "eventDate": "2024-02-20"}
    ]
  ''';

  List<CalendarEvent> _events = [];

  void _loadEventsFromJson() {
    final List<dynamic> jsonDataList = jsonDecode(jsonData);
    _events = jsonDataList.map((data) {
      return CalendarEvent(
        eventName: data['eventName'],
        eventDate: DateTime.parse(data['eventDate']),
      );
    }).toList();
  }

  Color getEventBackgroundColor(String eventName) {
    switch (eventName) {
      case 'P':
        return Colors.cyan.shade100;
      case 'A':
        return Colors.red.shade200;
      case 'L':
        return Colors.green.shade500;
      case 'H':
        return Colors.orange.shade300;
      case 'WH':
        return Colors.yellow.shade300;
      default:
        return Colors.transparent;
    }
  }

  Widget buildCell(DateTime date) {
    List<CalendarEvent> eventsOnDate = _events
        .where((event) => event.eventDate.isAtSameMomentAs(DateTime(date.year, date.month, date.day)))
        .toList();

    Color cellColor = Colors.transparent;

    if (eventsOnDate.isNotEmpty) {
      cellColor = getEventBackgroundColor(eventsOnDate.first.eventName);
    }

    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8),
          color: cellColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              date.day.toString(),
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
            Text(
              DateFormat('EEE').format(date), // Display the day of the week
              style: const TextStyle(
                color: Colors.black54,
                fontSize: 10,
                fontWeight: FontWeight.w200,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMonth(DateTime firstDayOfMonth) {
    List<Widget> dayWidgets = [];
    DateTime currentDate = DateTime(firstDayOfMonth.year, firstDayOfMonth.month, 1);
    int daysInMonth = DateTime(firstDayOfMonth.year, firstDayOfMonth.month + 1, 0).day;

    while (currentDate.month == firstDayOfMonth.month) {
      dayWidgets.add(buildCell(currentDate));
      currentDate = currentDate.add(const Duration(days: 1));
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
      ),
      itemBuilder: (BuildContext context, int index) {
        return dayWidgets[index];
      },
      itemCount: dayWidgets.length,
    );
  }

  Widget buildMonthHeader(String monthName) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4, left: 4, right: 4),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue.shade50,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Text(
            monthName,
            style: const TextStyle(
              color: Colors.black45,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              letterSpacing: 5
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _currentMonth = DateTime.now();
    _loadEventsFromJson();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 360,
      child: ListView.builder(
        itemCount: 12,
        itemBuilder: (BuildContext context, int monthIndex) {
          final DateTime currentMonth = DateTime.now();
          final DateTime firstDayOfMonth = DateTime(currentMonth.year, monthIndex + 1, 1);

          return Container(
            margin: const EdgeInsets.all(6),
            child: Column(
              children: [
                buildMonthHeader(DateFormat('MMMM').format(firstDayOfMonth)),
                buildMonth(firstDayOfMonth),
              ],
            ),
          );
        },
      ),
    );
  }
}



 */


