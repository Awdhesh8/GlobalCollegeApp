import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globalcollegeapp/utils/constants/teext_styles.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../../data/api/api_services.dart';
import '../../../../../../utils/constants/colors.dart';
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
          /// VT Letter Subject
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            decoration: const BoxDecoration(),
            constraints: const BoxConstraints(
              minHeight: 50.0,
            ),
            child: FutureBuilder<List<VtLetterSubject>>(
              future:
              ApiService.fetchVtLetterSubject(), // Fetch Gate Pass Reasons
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // Show shimmer loading effect while fetching
                  return Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      // Adjust height as needed
                      color: Colors.white,
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  // If data is fetched successfully
                  return _buildVtLetterSubjectDropdown(snapshot.data!);
                } else {
                  return const Text(
                      'No data available'); // Handle the case when there is no data
                }
              },
            ),
          ),

          const SizedBox(
            height: ESizes.spaceBtwItems,
          ),

            AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                decoration: const BoxDecoration(),
                constraints: const BoxConstraints(
                  minHeight: 50.0,
                ),
              //child: getCompanyData(controller.vtSubjectId),
                child: VtLetterCompany(),

              ),


          const SizedBox(
            height: ESizes.spaceBtwItems,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// From Date
              Obx(
                () => AnimatedContainer(
                  width: 165,
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
                    style: TextStyleClass.inputText1,
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
                      labelStyle: TextStyleClass.labelText1,
                      errorText: controller.fromError.value
                          ? 'Please Select init Date'
                          : null,
                    ),
                  ),
                ),
              ),

              /// To Date
              Obx(() => InkWell(
                    onTap: () {
                      // _selectDates(context, false, controller.toController);
                    },
                    child: AnimatedContainer(
                      width: 165,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      decoration: const BoxDecoration(),
                      constraints: const BoxConstraints(
                        minHeight: 50.0,
                      ),
                      child: TextFormField(
                        controller: TextEditingController(
                            text: controller.toController.value),
                        style: TextStyleClass.inputText1,
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
                          labelStyle: TextStyleClass.labelText1,
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
              style: TextStyleClass.inputText1,
              decoration: const InputDecoration(
                labelText: 'Duration (Days)',
                labelStyle: TextStyleClass.labelText1,
              ),
            ),
          ),

          const SizedBox(height: ESizes.spaceBtwItems),
          ElevatedButton(
            onPressed: () {
              FormUtils.submitForm(context, controller);
            },
            child: const Text('Submit Form'),
          ),

        ],

      ),
    );
  }


  Widget _buildVtLetterSubjectDropdown(List<VtLetterSubject> vtLetterSubject) {
    String initialValue = controller.subjectController.value?.id ?? '';

    if (initialValue.isEmpty) {
      initialValue = 'Select VT Letter Subject'; // Set default prompt
    }

    return DropdownButtonFormField<String>(
      isDense: true,
      value: initialValue, // Set initial value here
      decoration: InputDecoration(
        //labelText: 'Gate Pass Reasons',
        labelStyle: const TextStyle(color: EColors.textColorPrimary1),
        errorText: controller.subjectError.value
            ? 'Please Select Gate Pass Reason'
            : '',
        // : gatePassReasons.firstWhere((group) => group.id == null,
      ),
      onChanged: (String? newValue) {
        controller.subjectController.value =
            vtLetterSubject.firstWhere((group) => group.id == newValue);
            String selectedSubject = controller.subjectController.value?.id ?? '';
            controller.vtSubjectId = selectedSubject.obs;
            print(controller.vtSubjectId);
      },

      items: [
        const DropdownMenuItem<String>(
          value: 'Select VT Letter Subject',
          child: Text('Select VT Letter Subject',
              style: TextStyle(fontSize: 12)),
        ),
        ...vtLetterSubject
            .map<DropdownMenuItem<String>>((VtLetterSubject group) {
          return DropdownMenuItem<String>(
            value: group.id,
            child: Text(group.name, style: const TextStyle(fontSize: 12)),
          );
        }).toList(),
      ],
    );
  }

}

class VtLetterCompany extends StatelessWidget {
  //final controller = Get.find<GatePassFormController>();
  final controller = Get.put(VTLetterFormController());
  @override
  Widget build(BuildContext context) {
    print('object ${controller.vtSubjectId}');
    if(controller.vtSubjectId!='') {
      return FutureBuilder<List<VtLetterSubject>>(
        future:
        ApiService.fetchVtLetterSubject(), // Fetch Gate Pass Reasons
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show shimmer loading effect while fetching
            return Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                // Adjust height as needed
                color: Colors.white,
              ),
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData) {
            // If data is fetched successfully
            return _buildVtLetterSubjectDropdown(snapshot.data!);
          } else {
            return const Text(
                'No data available'); // Handle the case when there is no data
          }
        },
      );
    }else {
      return Text('data');
    }
  }

  Widget _buildVtLetterSubjectDropdown(List<VtLetterSubject> vtLetterSubject) {
    String initialValue = controller.subjectController.value?.id ?? '';

    if (initialValue.isEmpty) {
      initialValue = 'Select VT Letter Subject'; // Set default prompt
    }

    return DropdownButtonFormField<String>(
      isDense: true,
      value: initialValue, // Set initial value here
      decoration: InputDecoration(
        //labelText: 'Gate Pass Reasons',
        labelStyle: const TextStyle(color: EColors.textColorPrimary1),
        errorText: controller.subjectError.value
            ? 'Please Select Gate Pass Reason'
            : '',
        // : gatePassReasons.firstWhere((group) => group.id == null,
      ),
      onChanged: (String? newValue) {
        controller.subjectController.value =
            vtLetterSubject.firstWhere((group) => group.id == newValue);
        //print(controller.subjectController.value?.id);
      },

      items: [
        const DropdownMenuItem<String>(
          value: 'Select VT Letter Subject',
          child: Text('Select VT Letter Subject',
              style: TextStyle(fontSize: 12)),
        ),
        ...vtLetterSubject
            .map<DropdownMenuItem<String>>((VtLetterSubject group) {
          return DropdownMenuItem<String>(
            value: group.id,
            child: Text(group.id, style: const TextStyle(fontSize: 12)),
          );
        }).toList(),
      ],
    );
  }

}


class VtLetterSubject {
  final String id;
  final String name;

  VtLetterSubject({required this.id, required this.name});

  factory VtLetterSubject.fromJson(Map<String, dynamic> json) {
    return VtLetterSubject(
      id: json['vtsubj_id'] ?? '',
      name: json['vtsubj_name'] ?? '',
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
