import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:globalcollegeapp/features/home/screens/left_circle_menu_and_screens/gate_pass/gate_pass_controller/gate_pass_from_controller.dart';
import '../../../../../../../data/api/api_services.dart';
import '../../../applyLeave/widgets/shimmer/leave_shimmer_contanier.dart';

class GatePassHistory extends StatelessWidget {
  final controller = Get.find<GatePassFormController>();


  // List of reasons for the gate pass

  List<String> reasons = [
    'Meeting',
    'Personal',
    'Emergency',
    'Official Business',
  ];

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<List<Map<String, dynamic>>>(
      future: ApiService.getLeaveHistory(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // API call is still in progress, show a loading indicator
          return ShimmerLeaveHistory();
        } else if (snapshot.hasError) {
          // Error occurred while fetching leave history
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.data == null || snapshot.data!.isEmpty) {
          // No Gate Pass history data available
          return const Text('No Gate Pass history available');
        } else {
          // Convert dynamic list to List<Map<String, dynamic>>
          List<Map<String, dynamic>> leaveHistoryList =
          List<Map<String, dynamic>>.from(snapshot.data!);

          // Display leave application history using ListView.builder
          controller.gatePassHistory.clear();
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            //itemCount: leaveHistoryList.length,
            itemCount: reasons.length,
            itemBuilder: (context, index) {
              return ListTile(
                  dense: true,
                  title: Text(
                  "${reasons[index]}",
              ),
              );
            },
          );
        }
      },
    );

  }
}
