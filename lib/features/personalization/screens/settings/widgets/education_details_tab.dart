import 'package:flutter/material.dart';

class EducationalDetailsTab extends StatelessWidget {
  const EducationalDetailsTab({super.key,});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Add educational details here
          Text('Educational Details'),
        ],
      ),
    );
  }
}
