import 'package:flutter/material.dart';
import 'package:globalcollegeapp/common/widgets/appbar/appbar.dart';
import 'package:globalcollegeapp/utils/constants/colors.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../common/widgets/texts/top_first_heading.dart';
import '../../../../../data/api/api_services.dart';

class ApplyLeave extends StatelessWidget {
  const ApplyLeave({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LeaveFormController());
    return Scaffold(
      backgroundColor: EColors.backgroundColor,
      appBar: GAppBar(
        backgroundColor: Colors.transparent,
        showBackArrow: true,
        title: Text(
          'Apply Leave',
          style: TextStyle(
            fontSize: 20.0,
            fontFamily: 'Inter',
            color: EColors.textColorPrimary1,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              /// Top Heading
              const TopHeading(
                text: 'Need Time Off?\nApply Now!',
              ),

              /// Leave Form
              LeaveForm(),

              // Divider to separate current leave application and history
              Divider(),

              // Leave application history
              SingleChildScrollView(
                child: Container(
                    decoration: BoxDecoration(
                        color: EColors.backgroundColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: LeaveApplicationHistory()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LeaveFormController extends GetxController {
  RxString fromController = ''.obs;
  RxString toController = ''.obs;
  RxString reasonController = ''.obs;
  RxBool reasonError = false.obs;

  // RxList to store the history of leave applications
  RxList<String> leaveHistory = <String>[].obs;
}

class LeaveForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LeaveFormController());

    return Form(
      child: Column(
        children: [
          Obx(() => ListTile(
                title: Text(
                    'From Date: ${controller.fromController.value.isEmpty ? 'Select From Date' : controller.fromController.value}'),
                onTap: () {
                  print("Selecting From Date");
                  _selectDate(context, true, controller.fromController);
                },
              )),
          Obx(() => ListTile(
                title: Text(
                    'To Date: ${controller.toController.value.isEmpty ? 'Select To Date' : controller.toController.value}'),
                onTap: () {
                  print("Selecting To Date");
                  _selectDate(context, false, controller.toController);
                },
              )),
          Obx(() => TextFormField(
                onChanged: (value) {
                  controller.reasonController.value = value;
                  controller.reasonError.value =
                      false; // Reset the error state when the user starts typing
                },
                decoration: InputDecoration(
                  labelText: 'Reason',
                  errorText: controller.reasonError.value
                      ? 'Please enter a reason'
                      : null,
                ),
              )
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () async {
              if (_isValidForm(controller)) {
                // Save current leave application to history
                controller.leaveHistory
                    .insert(0, _formatLeaveApplication(controller));
                print("Form is valid. Submitting...");

                // Call the API to apply leave
                String apiResponse = await ApiService.applyLeave(
                  applyFrom: controller.fromController.value,
                  applyTo: controller.toController.value,
                  reason: controller.reasonController.value,
                );

                // Show a GetX snackbar with the API response message
                Get.snackbar(
                  'Leave Application',
                  apiResponse,
                  snackPosition: SnackPosition.BOTTOM,
                );

                // Clear the form fields after submission
                controller.fromController.value = '';
                controller.toController.value = '';
                controller.reasonController.value = '';
              }
            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate(
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

  bool _isValidForm(LeaveFormController controller) {
    if (controller.fromController.value.isEmpty ||
        controller.toController.value.isEmpty ||
        controller.reasonController.value.isEmpty) {
      controller.reasonError.value = controller.reasonController.value.isEmpty;
      print("Form validation failed");
      return false;
    }
    print("Form validation successful");
    return true;
  }

  String _formatLeaveApplication(LeaveFormController controller) {
    // Format leave application for display in history
    return 'From: ${controller.fromController.value}, To: ${controller.toController.value}, Reason: ${controller.reasonController.value}';
  }
}

class LeaveApplicationHistory extends StatelessWidget {
  final controller = Get.find<LeaveFormController>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: ApiService.getLeaveHistory(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // API call is still in progress, show a loading indicator
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          // Error occurred while fetching leave history
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.data == null || snapshot.data!.isEmpty) {
          // No leave history data available
          return Text('No leave history available');
        } else {
          // Convert dynamic list to List<Map<String, dynamic>>
          List<Map<String, dynamic>> leaveHistoryList = List<Map<String, dynamic>>.from(snapshot.data!);

          // Display leave application history using ListView.builder
          controller.leaveHistory.clear();
          for (var leaveData in leaveHistoryList) {
            // Format leave application for display in history
            String formattedLeave =
                'From: ${leaveData['applyfrom']}, To: ${leaveData['applyto']}, Reason: ${leaveData['leav_purpose']}';
            controller.leaveHistory.add(formattedLeave);
          }

          return ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: controller.leaveHistory.length,
            itemBuilder: (context, index) {
              final leaveApplication = controller.leaveHistory[index];
              return ListTile(
                title: Text(leaveApplication),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    // Delete the leave application
                    controller.leaveHistory.removeAt(index);
                  },
                ),
              );
            },
          );
        }
      },
    );
  }
}

// Shimmer effect widget for Leave Application History
class ShimmerLeaveHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        5, // You can adjust the count based on how many shimmer placeholders you want
            (index) => ListTile(
          title: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              height: 16.0,
              width: double.infinity,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:globalcollegeapp/common/widgets/appbar/appbar.dart';
// import 'package:globalcollegeapp/utils/constants/colors.dart';
// import 'package:get/get.dart';
// import '../../../../../common/widgets/texts/top_first_heading.dart';
//
// class ApplyLeave extends StatelessWidget {
//   const ApplyLeave({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: EColors.backgroundColor,
//       appBar: GAppBar(
//         backgroundColor: Colors.transparent,
//         showBackArrow: true,
//         title: Text(
//           'Apply Leave',
//           style: TextStyle(
//             fontSize: 20.0,
//             fontFamily: 'Inter',
//             color: EColors.textColorPrimary1,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(10.0),
//           child: Column(
//             children: [
//               /// Top Heading
//               TopHeading(
//                 text: 'Need Time Off?\nApply Now!',
//               ),
//
//               /// Leave Form
//               LeaveForm(),
//
//               // Divider to separate current leave application and history
//               Divider(),
//
//               // Leave application history
//               SingleChildScrollView(
//                 child: Container(
//                     decoration: BoxDecoration(
//                         color: EColors.backgroundColor,
//                         borderRadius: BorderRadius.circular(20)),
//                     child: LeaveApplicationHistory()),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class LeaveFormController extends GetxController {
//   RxString fromController = ''.obs;
//   RxString toController = ''.obs;
//   RxString reasonController = ''.obs;
//   RxBool reasonError = false.obs;
//
//   // RxList to store the history of leave applications
//   RxList<String> leaveHistory = <String>[].obs;
// }
//
// class LeaveForm extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(LeaveFormController());
//
//     return Form(
//       child: Column(
//         children: [
//           Obx(() => ListTile(
//                 title: Text(
//                     'From Date: ${controller.fromController.value.isEmpty ? 'Select From Date' : controller.fromController.value}'),
//                 onTap: () {
//                   print("Selecting From Date");
//                   _selectDate(context, true, controller.fromController);
//                 },
//               )),
//           Obx(() => ListTile(
//                 title: Text(
//                     'To Date: ${controller.toController.value.isEmpty ? 'Select To Date' : controller.toController.value}'),
//                 onTap: () {
//                   print("Selecting To Date");
//                   _selectDate(context, false, controller.toController);
//                 },
//               )),
//           Obx(() => TextFormField(
//                 onChanged: (value) {
//                   controller.reasonController.value = value;
//                   controller.reasonError.value =
//                       false; // Reset the error state when the user starts typing
//                 },
//                 decoration: InputDecoration(
//                   labelText: 'Reason',
//                   errorText: controller.reasonError.value
//                       ? 'Please enter a reason'
//                       : null,
//                 ),
//               )),
//           SizedBox(height: 16.0),
//           ElevatedButton(
//             onPressed: () {
//               if (_isValidForm(controller)) {
//                 // Save current leave application to history
//                 controller.leaveHistory
//                     .insert(0, _formatLeaveApplication(controller));
//                 print("Form is valid. Submitting...");
//
//                 // Clear the form fields after submission
//                 controller.fromController.value = '';
//                 controller.toController.value = '';
//                 controller.reasonController.value = '';
//               }
//             },
//             child: Text('Submit'),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Future<void> _selectDate(
//       BuildContext context, bool isFromDate, RxString controller) async {
//     DateTime currentDate = DateTime.now();
//     DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: currentDate,
//       firstDate: DateTime(2023),
//       lastDate: DateTime(2025),
//     );
//     if (picked != null && picked != currentDate) {
//       controller.value = _formatDate(picked);
//       print("Date selected: ${controller.value}");
//     } else {
//       print("Date selection canceled");
//     }
//   }
//
//   String _formatDate(DateTime date) {
//     return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
//   }
//
//   bool _isValidForm(LeaveFormController controller) {
//     if (controller.fromController.value.isEmpty ||
//         controller.toController.value.isEmpty ||
//         controller.reasonController.value.isEmpty) {
//       controller.reasonError.value = controller.reasonController.value.isEmpty;
//       print("Form validation failed");
//       return false;
//     }
//     print("Form validation successful");
//     return true;
//   }
//
//   String _formatLeaveApplication(LeaveFormController controller) {
//     // Format leave application for display in history
//     return 'From: ${controller.fromController.value}, To: ${controller.toController.value}, Reason: ${controller.reasonController.value}';
//   }
// }
//
// class LeaveApplicationHistory extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.find<LeaveFormController>();
//
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           'Leave Application History',
//           style: TextStyle(
//             fontSize: 18.0,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         SizedBox(height: 8.0),
//         // Display leave application history using ListView.builder
//         Obx(
//           () => ListView.builder(
//             shrinkWrap: true,
//             physics: NeverScrollableScrollPhysics(),
//             itemCount: controller.leaveHistory.length,
//             itemBuilder: (context, index) {
//               final leaveApplication = controller.leaveHistory[index];
//               return ListTile(
//                 title: Text(leaveApplication),
//                 trailing: IconButton(
//                   icon: Icon(Icons.delete),
//                   onPressed: () {
//                     // Delete the leave application
//                     controller.leaveHistory.removeAt(index);
//                   },
//                 ),
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }
