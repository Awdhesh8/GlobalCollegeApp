import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../../../utils/constants/colors.dart';

List<Map<String, dynamic>> educationalDetails = [
  {
    'type': 'High School',
    'details': {
      'School': 'ABC High School',
      'Board': 'State Board',
      'Passing Year': '2020',
      'Stream': 'All',
      'Maths' : '98',
      'English' : '98',
      'Physics' : '98',
      'Biology' : '98',
      'Sanskrit' : '98',
      'Chemistry' : '98',
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
      'Maths' : '98',
      'English' : '98',
      'Physics' : '98',
      'Chemistry' : '98',
      'Hindi' : '98',
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
      'Description': 'Developed a system for automating home appliances using IoT',
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
  final RxList<bool> isExpandedList;
  final void Function(int, bool) onExpansionChanged;

  const EducationDetailsPanel({
    Key? key,
    required this.educationalDetails,
    required this.isExpandedList,
    required this.onExpansionChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Obx(() => Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            decoration: ShapeDecoration(
              color: EColors.lightContainer1,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
              ),
            ),
            child: ExpansionPanelList(
              elevation: 0,
              expandedHeaderPadding: EdgeInsets.zero,
              expansionCallback: (panelIndex, isExpanded) =>
                  onExpansionChanged(panelIndex, !isExpanded),
              children: educationalDetails.asMap().entries.map(
                    (entry) => ExpansionPanel(
                  headerBuilder: (context, isExpanded) {
                    return ListTile(
                      title: Text(entry.value['type']),
                    );
                  },
                  body: ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (var key in entry.value['details'].keys)
                          ListTile(
                            title: Text(
                                '$key: ${entry.value['details'][key]}'),
                          ),
                      ],
                    ),
                  ),
                  isExpanded: isExpandedList[entry.key],
                  canTapOnHeader: true,
                  backgroundColor: Colors.transparent,
                ),
              ).toList(),
            ),
          ),
        ],
      )),
    );
  }
}