/*
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'model/model.dart';

class SemesterDetail extends StatelessWidget {
  final String? semester;
  final bool? isUniversityTab;
  final List<Subject>? universitySubjects;
  final List<Subject>? midtermSubjects;
  final List<Subject>? practicalSubjects;

  const SemesterDetail({
    Key? key,
    this.semester,
    this.isUniversityTab,
    this.universitySubjects,
    this.midtermSubjects,
    this.practicalSubjects,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey[900],
          title: Text(
            semester!,
            style: const TextStyle(
              fontSize: 24.0,
              fontFamily: 'Inter',
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          bottom: TabBar(
            indicatorColor: Colors.grey,
            labelColor: Colors.grey.shade800,
            tabs: [
              Tab(
                text: isUniversityTab! ? 'University' : 'Mid Term',
              ),
              const Tab(
                text: 'Practical',
              ),
            ],
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.white, Colors.blueGrey[50]!],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: TabBarView(
              children: [
                _buildTabContent(
                    isUniversityTab! ? universitySubjects : midtermSubjects),
                _buildTabContent(practicalSubjects),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTabContent(List<Subject>? subjects) {
    return subjects != null && subjects.isNotEmpty
        ? ListView.builder(
      itemCount: subjects.length,
      itemBuilder: (context, index) {
        final subject = subjects[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            color: Colors.blueGrey[100],
            borderRadius: BorderRadius.circular(20),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.all(20),
            leading: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.blueGrey[900],
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  FontAwesomeIcons.graduationCap,
                  color: Colors.white,
                ),
              ),
            ),
            title: Text(
              subject.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.blueGrey[900],
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.book,
                      color: Colors.blueGrey[900],
                      size: 16,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      'Marks: ${subject.marks}',
                      style: TextStyle(
                        color: Colors.blueGrey[900],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.percentage,
                      color: Colors.blueGrey[900],
                      size: 16,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      'SGPA: ${subject.marks}',
                      style: TextStyle(
                        color: Colors.blueGrey[900],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.chartLine,
                      color: Colors.blueGrey[900],
                      size: 16,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      'CGPA: ${subject.marks}',
                      style: TextStyle(
                        color: Colors.blueGrey[900],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    )
        : Center(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Text(
          'No subjects available',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}


 */


/*
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:globalcollegeapp/common/widgets/continue_border_Deco_rectangle/continue_border_rectangle.dart';
import 'package:globalcollegeapp/utils/constants/colors.dart';
import 'model/model.dart';

class SemesterDetail extends StatelessWidget {
  final String? semester;
  final bool? isUniversityTab;
  final List<Subject>? universitySubjects;
  final List<Subject>? midtermSubjects;
  final List<Subject>? practicalSubjects;

  const SemesterDetail({
    Key? key,
    this.semester,
    this.isUniversityTab,
    this.universitySubjects,
    this.midtermSubjects,
    this.practicalSubjects,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(semester!,
            style: const TextStyle(
              fontSize: 24.0,
              fontFamily: 'Inter',
              color: EColors.textColorPrimary1,
              fontWeight: FontWeight.w600,
            ),
          ),
          bottom: TabBar(
            dividerColor: Colors.transparent,
            indicatorColor: EColors.grey,
            labelColor: Colors.grey.shade800,
            // labelColor: EColors.grey,
            tabs: [
              Tab(
                text: isUniversityTab! ? 'University' : 'Mid Term',
              ),
              const Tab(
                text: 'Practical',
              ),
            ],
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.white, Colors.red.shade50],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: TabBarView(
              children: [

                _buildTabContent(
                    isUniversityTab! ? universitySubjects : midtermSubjects),
                _buildTabContent(practicalSubjects),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTabContent(List<Subject>? subjects) {
    return subjects != null && subjects.isNotEmpty
        ? GridView.builder(
          padding: const EdgeInsets.only(left: 10,right: 10, top: 4 , bottom: 4),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1.2,
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemCount: subjects.length,
          itemBuilder: (context, index) {
            final subject = subjects[index];
            return Container(
            decoration: CustomDeco.decoRectangle(),
              child: Padding(
                padding: const EdgeInsets.only(left: 18, top: 18, bottom: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      FontAwesomeIcons.book,
                      color: Colors.grey.shade700,
                      size: 36,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      subject.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.graduationCap,
                          color: Colors.grey,
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Marks: ${subject.marks}',
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        )
        : Center(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                'No subjects available',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
  }
}
 */
