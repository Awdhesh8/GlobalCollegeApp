import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globalcollegeapp/utils/constants/teext_styles.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../controller/form_controller.dart';
import '../functions/form_functions.dart';

class VTLetterForm extends StatelessWidget {
  /// Instance
  final controller = Get.put(VTLetterFormController());

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            children: [
              /// From Date
              Obx(
                () => AnimatedContainer(
                  width: 150,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  decoration: const BoxDecoration(),
                  constraints: const BoxConstraints(
                    minHeight: 50.0,
                  ),
                  child: TextFormField(
                    // readOnly: true,
                    controller: TextEditingController(
                        text: controller.fromController.value),
                    // text: 'Text here',
                    // controller: TextEditingController(text: controller.fromController.value.isEmpty ? 'From' : controller.fromController.value),
                    style: CustomTextStyle.inputText1,
                    onChanged: (value) {},

                    decoration: InputDecoration(
                      isDense: true,
                      suffixIcon: IconButton(
                        icon: const Icon(Iconsax.calendar_add),
                        onPressed: () {
                          FormUtils.selectDates(
                              context, controller.fromController);
                          // _selectDates(
                          //     context, false, controller.fromController);
                        },
                      ),
                      labelText: 'From',
                      labelStyle: CustomTextStyle.labelText1,
                      errorText: controller.fromError.value
                          ? 'Please Select init Date'
                          : null,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: ESizes.spaceBtwItems,
              ),

              /// To Date
              Obx(() => InkWell(
                    onTap: () {
                      // _selectDates(context, false, controller.toController);
                    },
                    child: AnimatedContainer(
                      width: 150,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      decoration: const BoxDecoration(),
                      constraints: const BoxConstraints(
                        minHeight: 50.0,
                      ),
                      child: TextFormField(
                        controller: TextEditingController(
                            text: controller.toController.value),
                        style: CustomTextStyle.inputText1,
                        onChanged: (value) {
                          // controller.toController.value.isEmpty
                          //     ? 'To'
                          //     : controller.toController.value;
                          // controller.reasonError.value = false;
                          // Reset the error state when the user starts typing
                        },
                        decoration: InputDecoration(
                          isDense: true,
                          suffixIcon: IconButton(
                            icon: const Icon(Iconsax.calendar_add),
                            onPressed: () {
                              FormUtils.selectDates(
                                  context, controller.toController);
                              // _selectDates(
                              //     context, false, controller.toController);
                            },
                          ),
                          labelText: 'To',
                          labelStyle: CustomTextStyle.labelText1,
                          errorText: controller.toError.value
                              ? 'Please Select to date'
                              : null,
                        ),
                        // maxLength: 250,
                        // maxLines:
                        //     null, // Allow the field to expand vertically as needed
                      ),
                    ),
                  )),
            ],
          ),
          const SizedBox(
            height: ESizes.spaceBtwItems,
          ),

          /// Calculate the Days form the From date and To date & show in this textfield
          Obx(
            () => TextFormField(
              readOnly: true,
              controller: TextEditingController(
                text: FormUtils.calculateDays(
                  controller.fromController.value,
                  controller.toController.value,
                ),
              ),
              style: CustomTextStyle.inputText1,
              decoration: const InputDecoration(
                labelText: 'Duration (Days)',
                labelStyle: CustomTextStyle.labelText1,
              ),
            ),
          ),

          const SizedBox(height: ESizes.spaceBtwItems),
          ElevatedButton(
            onPressed: () {
              FormUtils.submitForm(context, controller);
            },
            child: const Text('Submit Form'),
          )
        ],
      ),
    );
  }
}

/*
 /// Functions --->
  Future<void> _selectDates(
      BuildContext context, bool isFromDate, RxString controller) async {
    DateTime currentDate = DateTime.now();
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(2023),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != currentDate) {
      controller.value = _formatDate(picked);
      print("Date selected: ${controller.value}");
    } else {
      print("Date selection canceled");
    }
  }

  String _formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }

  bool _isValidForm(VTLetterFormController controller) {
    if (controller.fromController.value.isEmpty ||
        controller.toController.value.isEmpty ||
        controller.subjectsController.value.isEmpty) {
      controller.reasonError.value =
          controller.subjectsController.value.isEmpty;
      controller.toError.value = controller.toController.value.isEmpty;
      controller.fromError.value = controller.fromController.value.isEmpty;

      print("Form validation failed");
      return false;
    }
    print("Form validation successful");
    return true;
  }

  String _calculateDays(String fromDate, String toDate) {
    try {
      DateTime from = DateTime.parse(fromDate);
      DateTime to = DateTime.parse(toDate);
      Duration duration = to.difference(from);
      return duration.inDays.toString();
    } catch (e) {
      print("Error parsing dates: $e");
      return 'Invalid date format';
    }
  }


  Future<void> _submitForm(
      BuildContext context, VTLetterFormController controller) async {
    if (_isValidForm(controller)) {
      // Perform form submission logic here
      print("Form submitted successfully");
    } else {
      print("Form submission failed");
    }
  }
 */
