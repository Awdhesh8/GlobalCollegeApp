import 'package:flutter/material.dart';

class PersonalDetailsTab extends StatelessWidget {
  const PersonalDetailsTab({super.key,});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Add profile details here
          Text('Personal Details',

          ),
        ],
      ),
    );
  }
}
