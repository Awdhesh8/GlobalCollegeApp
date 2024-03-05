import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globalcollegeapp/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../../common/widgets/animations/animation_class.dart';
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
      // padding: const EdgeInsets.all(16),
      decoration: CustomDeco.decoRectangle(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: ShapeDecoration(
                      shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(70.0),
                      ),
                      color: Colors.white,
                      shadows: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        result.semester,
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // const SizedBox(height: ESizes.spaceBtwItems),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 5),
            child: Row(
              children: [
                CustomAnimatedButton(
                  onNavigate: () {
                    Get.to(() => SemesterDetail(
                          semester: result.semester,
                          universitySubjects: result.universitySubjects,
                          midtermSubjects: result.midtermSubjects,
                          practicalSubjects: result.practicalSubjects,
                          isUniversityTab: true,
                        ));
                  },
                  buttonColor: Colors.white,
                  borderRadius: 50,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                  height: 40,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Final Exam',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 12,
                          color: EColors.textColorPrimary1,
                        ),
                      ),
                      Icon(
                        Iconsax.send_2,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 2),
            child: Row(
              children: [
                CustomAnimatedButton(
                    onNavigate: () {
                      Get.to(() => SemesterDetail(
                            semester: result.semester,
                            universitySubjects: result.universitySubjects,
                            midtermSubjects: result.midtermSubjects,
                            practicalSubjects: result.practicalSubjects,
                            isUniversityTab: false,
                          ));
                    },
                    buttonColor: Colors.white,
                    // borderColor: Colors.pinkAccent,
                    borderRadius: 50,
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                    height: 40,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Mid Term',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 12,
                            color: EColors.textColorPrimary1,
                          ),
                        ),
                        Icon(
                          Iconsax.send_2,
                          size: 20,
                        ),
                        /*
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
                 */
                      ],
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
