
import 'package:flutter/material.dart';
import 'package:globalcollegeapp/features/time_table/widgets/decoration/contanier_decoration.dart';
import 'package:globalcollegeapp/utils/constants/colors.dart';
import 'package:shimmer/shimmer.dart';
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
      // backgroundColor: EColors.backgroundColor,
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
            return ShimmerLoading();
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
                          return buildDayTimetable(dayData);
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

  Widget buildDayTimetable(Map<String, dynamic> dayData) {
    String day = dayData.keys.first;
    List<Map<String, dynamic>> timetableForDay =
        (dayData[day] as List?)?.cast<Map<String, dynamic>>() ?? [];
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Timetable for $day',
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: EColors.textColorPrimary1,
                  fontFamily: 'Inter'
              ),
            ),
            const SizedBox(height: 20),
            for (var entry in timetableForDay)
              buildPeriodCard(entry),
            // buildPeriodCard(entry),
            // ... Additional UI elements
          ],
        ),
      ),
    );
  }

  Widget buildPeriodCard(Map<String, dynamic> period) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: customDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Lecture ${period['period'] ?? ''}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF3C4043),
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            period['time'] ?? '',
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
          Text(
            period['subject'] ?? '',
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              // color: Color(0xFF9C27B0),
              color: EColors.primary,
            ),
          ),
          if (period['teacher'] != null)
            Text(
              'Lecturer: ${period['teacher']}',
              style: const TextStyle(
                color: Color(0xFF3C4043),
                fontSize: 13,
              ),
            ),
        ],
      ),
    );

  }

  /// Shimmer Widget ---->>>
  Widget ShimmerLoading() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[200]!,
      highlightColor: Colors.white,
      // highlightColor: Colors.grey[50]!,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height:50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(14))
                ),
              ),
              SizedBox(height: 20,),
              Container(
                width: double.infinity,
                height:500,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(14))
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }

}
