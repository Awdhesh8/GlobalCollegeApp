import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../../../common/widgets/appbar/appbar.dart'; // Import your app bar widget
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class Activity extends StatefulWidget {
  const Activity({super.key});

  @override
  _ActivityState createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  // Sample data in JSON format
  final List<Map<String, dynamic>> eventData = [
    {
      'type': 'Party',
      'venue': 'City Clubhouse',
      'dateTime': 'March 15, 2024 - 8:00 PM',
      'image': 'assets/Backgrounds/activity1.jpg',
    },
    {
      'type': 'Event',
      'venue': 'Grand Convention Center',
      'dateTime': 'March 20, 2024 - 7:30 PM',
      'image': 'assets/Backgrounds/activity2.jpg',
    },
    // Add more events as needed
  ];

  int selectedEventIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GAppBar(

      ), // Replace MyAppBar with your app bar widget
      body: Stack(
        children: [
          // Background image with gradient and event details
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(eventData[selectedEventIndex]['image']),
                fit: BoxFit.cover,
              ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.7),
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Display event details on top of the image
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        eventData[selectedEventIndex]['type'],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        eventData[selectedEventIndex]['venue'],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        eventData[selectedEventIndex]['dateTime'],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Cards for other events
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
               height: MediaQuery.of(context).size.height * 0.3,
              child: ListView.builder(
                itemCount: eventData.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedEventIndex = index;
                      });
                    },
                    child: Card(
                      surfaceTintColor: Colors.transparent,
                      // elevation: 4,
                      margin: EdgeInsets.all(8),
                      child: Container(
                        width: 200, // Adjust the card width as needed
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              eventData[index]['type'],
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              eventData[index]['venue'],
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              eventData[index]['dateTime'],
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
