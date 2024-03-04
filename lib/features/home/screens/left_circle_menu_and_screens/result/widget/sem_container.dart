import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../../common/widgets/continue_border_Deco_rectangle/continue_border_rectangle.dart';
import '../../../../../../utils/constants/colors.dart';
import '../model/model.dart';
import '../sem_details.dart';

class SemContainer extends StatelessWidget {
  const SemContainer({
    super.key,
    required this.result,
  });

  final AcademicResult result;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: CustomDeco.decoRectangle(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            result.semester,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween ,
            children: [
              const Text(
                'Final Exam',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 12,
                  color: EColors.textColorPrimary1,
                ),
              ),
              IconButton(
                onPressed: () {
                  Get.to(() => SemesterDetail(
                    semester: result.semester,
                    universitySubjects:
                    result.universitySubjects,
                    midtermSubjects:
                    result.midtermSubjects,
                    practicalSubjects:
                    result.practicalSubjects,
                    isUniversityTab: true,
                  ));
                },
                icon: const Icon(Iconsax.arrow_right_4),
              ),
            ],
          ),
          Row(
            children: [
              const Text(
                'Mid Term',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 12,
                  color: EColors.textColorPrimary1,
                ),
              ),
              IconButton(
                onPressed: () {
                  Get.to(() => SemesterDetail(
                    semester: result.semester,
                    universitySubjects:
                    result.universitySubjects,
                    midtermSubjects:
                    result.midtermSubjects,
                    practicalSubjects:
                    result.practicalSubjects,
                    isUniversityTab: false,
                  ));
                },
                icon: const Icon(Iconsax.arrow_right_4),
              ),
            ],
          ),
        ],
      ),
    );
  }
}