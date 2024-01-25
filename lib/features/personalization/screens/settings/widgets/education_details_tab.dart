import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../utils/constants/colors.dart';

List<Map<String, dynamic>> educationalDetails = [
  {
    'type': 'High School',
    'details': {
      'School': 'ABC High School',
      'Board': 'State Board',
      'Passing Year': '2020',
      'Stream': 'All',
      'Maths': '98',
      'English': '98',
      'Physics': '98',
      'Biology': '98',
      'Sanskrit': '98',
      'Chemistry': '98',
      'Percentage': '85%',
    },
  },
  {
    'type': 'Higher Secondary School',
    'details': {
      'School': 'XYZ Higher Secondary School',
      'Board': 'State Board',
      'Passing Year': '2022',
      'Stream': 'PCM',
      'Maths': '98',
      'English': '98',
      'Physics': '98',
      'Chemistry': '98',
      'Hindi': '98',
      'Percentage': '85%',
    },
  },
  {
    'type': 'College',
    'details': {
      'Name': 'Global Engineering College',
      'Semester': '3rd',
      'Branch': 'Computer Science',
      'CGPA': '9.5',
    },
  },
  {
    'type': 'Internship',
    'details': {
      'Company': 'Tech Solutions Ltd.',
      'Duration': '3 months',
      'Role': 'Software Developer Intern',
    },
  },
  {
    'type': 'Project',
    'details': {
      'Title': 'Smart Home Automation',
      'Duration': '6 months',
      'Description':
          'Developed a system for automating home appliances using IoT',
    },
  },
  {
    'type': 'Achievements',
    'details': {
      '1': 'Winner - Coding Competition',
      '2': 'Runner-up - Science Exhibition',
    },
  },
];

class EducationDetailsPanel extends StatelessWidget {
  final List<Map<String, dynamic>> educationalDetails;

  const EducationDetailsPanel({
    Key? key,
    required this.educationalDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Container(
        decoration: ShapeDecoration(
          color: EColors.lightContainer1,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        child: Column(
          children: educationalDetails.map((entry) {
            return ListTile(
              trailing: const Icon(
                Iconsax.folder_open4,
                color: EColors.primary,
              ),
              title: Text(entry['type']),
              onTap: () {
                // Show educational details in AlertDialog
                _showEducationalDetailsDialog(context, entry);
              },
            );
          }).toList(),
        ),
      ),
    );
  }

  void _showEducationalDetailsDialog(BuildContext context, Map<String, dynamic> details) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              elevation: 0,
              backgroundColor: Colors.transparent,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        details['type'],
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: EColors.primary, // Customize the color
                        ),
                      ),
                      const SizedBox(height: 16),
                      for (var key in details['details'].keys)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Text(
                                  key,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: EColors.textColorPrimary1,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                flex: 3,
                                child: Text(
                                  details['details'][key],
                                  style: const TextStyle(
                                    color: EColors.primarySecond,
                                  ),
                                  maxLines: 2, // Adjust the number of lines
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      const SizedBox(height: 16),
                      Align(
                        alignment: Alignment.center,
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Close'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

}
