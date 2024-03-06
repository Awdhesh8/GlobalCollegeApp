import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Import Font Awesome icons
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
          child: TabBarView(
            children: [
              _buildTabContent(
                  isUniversityTab! ? universitySubjects : midtermSubjects),
              _buildTabContent(practicalSubjects),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabContent(List<Subject>? subjects) {
    return subjects != null && subjects.isNotEmpty
        ? GridView.builder(
          padding: EdgeInsets.all(15),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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

/// Liquid Swipe
/*
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
      ),
      body: LiquidSwipe(
        pages: [
          _buildTabContent(
              isUniversityTab! ? universitySubjects : midtermSubjects,
              Colors.blue,
              Icons.school),
          _buildTabContent(practicalSubjects, Colors.green, Icons.build),
        ],
        enableLoop: true,
        waveType: WaveType.liquidReveal,
        slideIconWidget: Container(
            decoration: ShapeDecoration(
              color: Colors.black54,
                shape: OvalBorder(side: BorderSide(color: Colors.white))
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.arrow_back_ios, color: Colors.white,),
            )),
        positionSlideIcon: .8,
      ),
    );
  }

  Widget _buildTabContent(
      List<Subject>? subjects, Color backgroundColor, IconData iconData) {
    return Container(
      color: backgroundColor,
      child: subjects != null
          ? ListView.builder(
              itemCount: subjects.length,
              itemBuilder: (context, index) {
                final subject = subjects[index];
                return ListTile(
                  title: Text(
                    subject.name,
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    'Marks: ${subject.marks}',
                    style: TextStyle(color: Colors.white),
                  ),
                  leading: Icon(
                    iconData,
                    color: Colors.white,
                  ),
                  // You can customize the ListTile further based on your needs
                );
              },
            )
          : Center(
              child: Text(
                'No subjects available',
                style: TextStyle(color: Colors.white),
              ),
            ),
    );
  }
}


 */
