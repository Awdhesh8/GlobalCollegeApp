import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globalcollegeapp/features/home/screens/left_circle_menu_and_screens/result/widget/animation.dart';
import 'package:globalcollegeapp/features/home/screens/left_circle_menu_and_screens/result/widget/sem_container.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/continue_border_Deco_rectangle/continue_border_rectangle.dart';
import '../../../../../common/widgets/texts/top_first_heading.dart';
import '../../../../../utils/constants/colors.dart';
import 'controller/controller.dart';

class Result extends StatelessWidget {
  const Result({Key? key});

  @override
  Widget build(BuildContext context) {
    final ResultController resultController = Get.put(ResultController());
    final CustomAnimationController animationController =
        Get.put(CustomAnimationController());

    return Scaffold(
      backgroundColor: EColors.backgroundColor,

      /// App Bar
      appBar: const GAppBar(
        backgroundColor: Colors.transparent,
        showBackArrow: true,
        title: Text(
          'Your Results',
          style: TextStyle(
            fontSize: 24.0,
            fontFamily: 'Inter',
            color: EColors.textColorPrimary1,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      /// Body
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Overall Status Card
              CustomAnimation(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: CustomDeco.decoRectangle(),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TopHeading(
                        fontSize: 26,
                        text: 'Overall Performance',
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: TextStyle(
                              fontSize: 16,
                              color: EColors.textColorPrimary1,
                            ),
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              /// Semester-wise Results
              Obx(
                () => GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 170,
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                  ),
                  itemCount: resultController.results.length,
                  itemBuilder: (context, index) {
                    final result = resultController.results[index];
                    return CustomAnimation(
                      child: SemContainer(result: result),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


