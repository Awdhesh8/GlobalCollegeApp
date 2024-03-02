import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../../../common/widgets/texts/top_first_heading.dart';
import '../../../../../../../utils/constants/colors.dart';
import '../../../../../../../utils/constants/sizes.dart';
import '../BottomSheetContainerDecoration/bottom_sheet_container.dart';

class GatePassController extends GetxController {
  var selectedTime = ''.obs;
  // var selectedReason = ''.obs;
  var applicationText = ''.obs;
  final TextEditingController reasonController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final RxString selectedReason = ''.obs;
}

class GatePassForm extends StatelessWidget {
  final GatePassController controller = Get.put(GatePassController());

  // List of reasons for the gate pass
  List<String> reasons = [
    'Meeting',
    'Personal',
    'Emergency',
    'Official Business',
  ];

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          const SizedBox(
            height: ESizes.spaceBtwItems,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              /// Pick Time
              InkWell(
                onTap: () async {
                  TimeOfDay? pickedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );

                  if (pickedTime != null) {
                    controller.selectedTime.value = pickedTime.format(context);
                  }
                },
                child: Obx(
                  () => AnimatedContainer(
                    width: 150,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    decoration: const BoxDecoration(),
                    constraints: const BoxConstraints(
                      minHeight: 50.0,
                    ),
                    child: TextFormField(
                      readOnly: true,
                      controller: TextEditingController(
                          text: controller.selectedTime.value),
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 13,
                        color: EColors.textColorPrimary1,
                      ),
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        isDense: true,
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.timer_outlined),
                          onPressed: () async {
                            TimeOfDay? pickedTime = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );

                            if (pickedTime != null) {
                              controller.selectedTime.value =
                                  pickedTime.format(context);
                            }
                          },
                        ),
                        labelText: 'Time',
                        labelStyle: const TextStyle(
                          color: Colors.black54,
                          fontSize: 13,
                          fontFamily: 'Inter',
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(
                width: ESizes.spaceBtwItems,
              ),

              /// Reasons (In Bottom Sheet)
              InkWell(
                onTap: () {
                  _showReasonBottomSheet(context);
                },
                child: Obx(
                  () => AnimatedContainer(
                    width: 150,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    decoration: const BoxDecoration(),
                    constraints: const BoxConstraints(
                      minHeight: 50.0,
                    ),
                    child: TextFormField(
                      controller: TextEditingController(
                          text: controller.selectedReason.value),
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 13,
                        color: EColors.textColorPrimary1,
                      ),
                      onChanged: (value) {
                        controller.selectedReason.value;
                      },
                      decoration: InputDecoration(
                        isDense: true,
                        suffixIcon: IconButton(
                          onPressed: () {
                            _showReasonBottomSheet(context);
                          },
                          icon: Icon(
                            Iconsax.document_text,
                          ),
                        ),
                        labelText: 'Reasons',
                        labelStyle: const TextStyle(
                          color: Colors.black54,
                          fontSize: 13,
                          fontFamily: 'Inter',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: ESizes.spaceBtwItems,
          ),

          /// Student gow With (Text Field)
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            decoration: const BoxDecoration(),
            constraints: const BoxConstraints(
              minHeight: 50.0,
            ),
            child: TextFormField(
              style: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 13,
                color: EColors.textColorPrimary1,
              ),
              onChanged: (value) {
                controller.applicationText.value = value;
              },
              decoration: const InputDecoration(
                isDense: true,
                suffixIcon: Icon(Iconsax.text_block),
                labelText: 'Gow with (Person Name)',
                labelStyle: TextStyle(
                  color: Colors.black54,
                  fontSize: 13,
                  fontFamily: 'Inter',
                ),
              ),
              minLines: 1,
              // maxLength: 250,
              maxLines: null,
            ),
          ),
          const SizedBox(
            height: ESizes.spaceBtwItems,
          ),

          /// Application
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            decoration: const BoxDecoration(),
            constraints: const BoxConstraints(
              minHeight: 50.0,
            ),
            child: TextFormField(
              style: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 13,
                color: EColors.textColorPrimary1,
              ),
              onChanged: (value) {
                controller.applicationText.value = value;
              },
              decoration: const InputDecoration(
                isDense: true,
                suffixIcon: Icon(Iconsax.document_text_1),
                labelText: 'Gate Pass Application',
                labelStyle: TextStyle(
                  color: Colors.black54,
                  fontSize: 13,
                  fontFamily: 'Inter',
                ),
              ),
              minLines: 3,
              maxLength: 250,
              maxLines: null,
            ),
          ),

          /// Submit button
          ElevatedButton(
            onPressed: () {
              // Add your submit logic here
            },
            child: const Text('Submit'),
          ),

          /// Divider to separate current Gate Pass application and history
          const Divider(),

          /// Leave application history
          const TopHeading(
            text: 'History',
          ),

          SingleChildScrollView(
            child: Container(
              decoration: const BoxDecoration(
                color: EColors.backgroundColor,
              ),
              child: Text('History Container'),
            ),
          ),
        ],
      ),
    );
  }

  void _showReasonBottomSheet(BuildContext context) {
    Get.bottomSheet(
      elevation: 8,
      BottomSheetContainer(
        child: ListView.builder(
          itemCount: reasons.length,
          itemBuilder: (context, index) {
            return ListTile(
              dense: true,
              title: Text(
                "${reasons[index]}",
              ),
              onTap: () {
                controller.selectedReason.value =
                    reasons[index]; // Update using the controller
                Get.back(); // Close the bottom sheet
              },
            );
          },
        ),
      ),
    );
  }
}
