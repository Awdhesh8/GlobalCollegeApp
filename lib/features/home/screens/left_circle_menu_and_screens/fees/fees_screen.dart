import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globalcollegeapp/data/api/api_services.dart';
import 'package:globalcollegeapp/features/home/screens/left_circle_menu_and_screens/fees/semister_fees/semister_fees_screen.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../utils/constants/colors.dart';

class FeesController extends GetxController {
  RxList<Map<String, dynamic>> data = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> summary = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> profileData = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchFeeSummary();
    fetchProfileData();
  }

  Future<void> fetchProfileData() async {
    try {
      Map<String, dynamic>? responseData = await ApiService.getProfileData();
      if (responseData!.containsKey('response')) {
        // Extracting the list of profiles from the 'response' key
        List<Map<String, dynamic>> profiles = List<Map<String, dynamic>>.from(responseData['response']);
        // Assigning the profiles to profileData
        profileData.assignAll(profiles);
      }
      print(profileData);
    } catch (e) {
      print('Error fetching profile data: $e');
    }
  }

  Future<void> fetchFeeSummary() async {
    try {
      Map<String, dynamic> result = await ApiService.fetchFeeSummary();
      print(result);
      if (result.containsKey('data')) {
        data.assignAll(List<Map<String, dynamic>>.from(result['data']));
      }
      if (result.containsKey('summary')) {
        summary.assignAll(List<Map<String, dynamic>>.from(result['summary']));
      }
    } catch (e) {
      print("Error: $e");
    }
  }
}

class FeesScreen extends StatelessWidget {
  final FeesController feesController = Get.put(FeesController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: EColors.backgroundColor,
      appBar: const GAppBar(
        backgroundColor: Colors.transparent,
        showBackArrow: true,
        title: Text(
          'Sem Fees',
          style: TextStyle(
            color: EColors.textColorPrimary1,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Obx(
                  () {
                if (feesController.profileData.isEmpty ||
                    feesController.data.isEmpty ||
                    feesController.summary.isEmpty) {
                  return Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Column(
                      children: List.generate(
                        6,
                            (index) => ShimmerItem(),
                      ),
                    ),
                  );
                } else {
                  final profileData = feesController.profileData.first;
                  return Column(
                    children: [
                      ProfileDetail(profileData: profileData),

                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 18),
                        child: Divider(),
                      ),
                      const HeaderText(),
                      ...feesController.data.map((data) {
                        return SemesterDetailsCard(data: data);
                      }).toList(),

                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 18),
                        child: Divider(),
                      ),
                      SummaryCard(
                        summaryData: feesController.summary.first,
                      ),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileDetail extends StatelessWidget {
  const ProfileDetail({
    super.key,
    required this.profileData,
  });

  final Map<String, dynamic> profileData;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Image.network(profileData['Profile_photo'] ?? '',
          fit: BoxFit.fill,
          width: 60,
          height: 60,
        ),
      ),
      // leading: Image.network(profileData['Profile_photo'] ?? ''),
      title: Row(
        children: [
          const Text('Hello, ',
          style: TextStyle(
             fontSize: 16,
            fontFamily: 'Inter',
            color: Colors.black45,
          ),
          ),
          Text('${profileData['student_name']}',
            style: const TextStyle(
              fontSize: 16,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              color: EColors.textColorPrimary1,
            ),
          ),
        ],
      ),
      subtitle: Text('GNo: ${profileData['GNo']}',
        style: const TextStyle(
          fontSize: 14,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
          color: EColors.textColorPrimary1,
        ),
      ),
    );
  }
}

class HeaderText extends StatelessWidget {
  const HeaderText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: const BoxDecoration(
            color: EColors.circleAvatar,
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child:
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
          child: Text(
            'Breakdown of Student Fees by Semester',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: EColors.textColorPrimary1,
                fontSize: 10,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                overflow:TextOverflow.ellipsis
            ),
          ),
        ),
      ),
    );
  }
}

class SemesterDetailsCard extends StatelessWidget {
  final Map<String, dynamic> data;

  SemesterDetailsCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFFFFE0E5),
        // color: EColors.backgroundColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color(0xFFFFC1C5),
            offset: Offset(2, 2),
            blurRadius: 2,
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Colors.white,
            offset: Offset(-2, -2),
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Semester ${data["sem"]}',
                  // 'Semester ${details['Semester']}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: EColors.textColorPrimary1,
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Icon(
                      Icons.payment,
                      color: Colors.pinkAccent,
                      size: 18,
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        'Sem Fees: ₹${data["commit"]}',
                        // 'Per Semester: ₹${details['Per Semester']}',
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: EColors.textColorPrimary1,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.attach_money,
                      color: Colors.pinkAccent,
                      size: 18,
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        'Paid Fees: ₹${data["paid"]}',
                        // 'Per Semester: ₹${details['Per Semester']}',
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: EColors.textColorPrimary1,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.account_balance_wallet,
                      color: Colors.pinkAccent,
                      size: 18,
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        'Rest Amount: ₹${data["balance"]}',
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: EColors.textColorPrimary1,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              if (data["viewmore"] is List &&
                  (data["viewmore"] as List).isNotEmpty) {
                Get.to(
                  () => ViewMoreScreen(data["viewmore"], data['sem'], data['commit'], data['paid'],data['balance']),
                  transition: Transition.cupertino,
                  duration: const Duration(
                      milliseconds: 500), // Adjust the duration as needed
                  curve: Curves.easeInOut, // Use a different curve if desired
                );
              } else if (data["viewmore"] is List &&
                  (data["viewmore"] as List).isEmpty) {
                Get.snackbar('Empty Fees', 'Sem data is empty.');
              } else if (data["viewmore"] is Map &&
                  (data["viewmore"] as Map).isNotEmpty) {
                Get.to(
                  () => ViewMoreScreen(data["viewmore"], data['sem'], data['commit'], data['paid'],data['balance']),
                  transition: Transition.cupertino,
                  duration: const Duration(
                      milliseconds: 500), // Adjust the duration as needed
                  curve: Curves.easeInOut, // Use a different curve if desired
                );
              } else {
                Get.snackbar('Error', 'Unable to process ViewMore data.');
              }
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.redAccent.shade400,
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xFFFFC1C5),
                    offset: Offset(2, 2),
                    blurRadius: 5,
                    spreadRadius: 1,
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-3, -3),
                    blurRadius: 5,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: const Icon(
                Icons.arrow_forward_ios,
                color: EColors.backgroundColor,
                size: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SummaryCard extends StatelessWidget {
  final Map<String, dynamic> summaryData;

  SummaryCard({required this.summaryData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      padding: const EdgeInsets.only(left: 15, right: 10, top: 8,bottom: 5),
      decoration: BoxDecoration(
        color: EColors.backgroundColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.red.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Total',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: EColors.textColorPrimary1,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(
                Icons.payment,
                color: Colors.pinkAccent,
                size: 18,
              ),
              const SizedBox(width: 5),
              Text(
                'Sem Fees: ${summaryData['tcommit']}',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: EColors.textColorPrimary1,
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.attach_money,
                color: Colors.pinkAccent,
                size: 18,
              ),
              const SizedBox(width: 5),
              Text(
                'Total Paid: ${summaryData['tpaid']}',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: EColors.textColorPrimary1,
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.account_balance_wallet,
                color: Colors.pinkAccent,
                size: 18,
              ),
              const SizedBox(width: 5),
              Text(
                'Total Balance: ${summaryData['tbal']}',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: EColors.textColorPrimary1,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

class ShimmerItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Column(
          children: List.generate(3, (index) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 16,
                    width: 100,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 10),
                  Container(
                    height: 12,
                    width: 80,
                    color: Colors.white,
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}



/// Correctly Fetch the API

/*
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:globalcollegeapp/data/api/api_services.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../utils/constants/colors.dart';

class FeesController extends GetxController {
  RxList<Map<String, dynamic>> data = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchFeeSummary();
  }

  Future<void> fetchFeeSummary() async {
    try {

      Map<String, dynamic> result = await ApiService.fetchFeeSummary();
      print(result);
      if (result.containsKey('data')) {
        data.assignAll(List<Map<String, dynamic>>.from(result['data']));
      }
    } catch (e) {
      print("Error: $e");
    }
  }
}

class FeesScreen extends StatelessWidget {
  final FeesController feesController = Get.put(FeesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EColors.backgroundColor,
      appBar: const GAppBar(
        backgroundColor: Colors.transparent,
        showBackArrow: true,
        // centerTitle: true,
        title: Text(
          'Sem Fees',
          style: TextStyle(
            // fontFamily: 'Inter',
            color: EColors.textColorPrimary1,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Obx(
            () => feesController.data.isEmpty
            ? Center(child: CircularProgressIndicator())
            : Column(
          children: [
            for (var item in feesController.data)
              ListTile(
                title: Text('Semester ${item["sem"]}'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Commit: ${item["commit"]}'),
                    Text('Paid: ${item["paid"]}'),
                    Text('Balance: ${item["balance"]}'),
                  ],
                ),
                trailing: IconButton(
                  icon: Icon(Icons.arrow_forward),
                  onPressed: () {
                    // Check if viewmore is a list and not empty before navigating
                    if (item["viewmore"] is List && (item["viewmore"] as List).isNotEmpty) {
                      Get.to(ViewMoreScreen(item["viewmore"]));
                    } else if (item["viewmore"] is List && (item["viewmore"] as List).isEmpty) {
                      // Handle when viewmore is a list but empty
                      Get.snackbar('Empty Fees', 'Sem data is empty.');
                    } else if (item["viewmore"] is Map && (item["viewmore"] as Map).isNotEmpty) {
                      // Handle when viewmore is a map and not empty
                      Get.to(ViewMoreScreen(item["viewmore"]));
                    } else {
                      // Handle any other case (optional)
                      Get.snackbar('Error', 'Unable to process ViewMore data.');
                    }
                  },
                ),


              ),
          ],
        ),
      ),
    );
  }
}

class ViewMoreScreen extends StatelessWidget {
  final Map<String, dynamic> viewMoreData;

  ViewMoreScreen(this.viewMoreData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View More'),
      ),
      body: ListView(
        children: [
          for (var entry in viewMoreData.entries)
            ListTile(
              title: Text(entry.key),
              subtitle: Text(entry.value.toString()),
            ),
        ],
      ),
    );
  }
}

 */

/// Correct UI code
/*
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globalcollegeapp/common/widgets/appbar/appbar.dart';
import 'package:globalcollegeapp/features/home/screens/left_circle_menu_and_screens/fees/semister_fees/semister_fees_screen.dart';
import 'package:globalcollegeapp/utils/constants/colors.dart';
import 'package:globalcollegeapp/common/widgets/profile_image_name/profile_header_name_image.dart';
import 'package:globalcollegeapp/common/widgets/texts/text_styles.dart';
import 'fees_contanier/fees_contents_contanier.dart';

class FeesScreen extends StatelessWidget {
  const FeesScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EColors.backgroundColor,
      appBar: const GAppBar(
        backgroundColor: Colors.transparent,
        showBackArrow: true,
        centerTitle: true,
        title: Text(
          'Fees',
          style: TextStyle(
            color: EColors.textColorPrimary1,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
               Padding(
                padding: const EdgeInsets.only(right: 40),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: EColors.backgroundColor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0xFFFFC1C5),
                        offset: Offset(-2, -2),
                        blurRadius: 5,
                        spreadRadius: 1,
                      ),
                      BoxShadow(
                        color: Color(0xFFFFE0E5),
                        offset: Offset(2, 2),
                        blurRadius: 5,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.pinkAccent,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.pinkAccent.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.person,
                          color: EColors.backgroundColor,
                          size: 40,
                        ),
                      ),
                      const SizedBox(width: 16),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Surya Pratap Singh',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: EColors.textColorPrimary1,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'GN/212/ME/2024/CS',
                              style:  TextStyle(
                                fontSize: 14,
                                color: EColors.textColorPrimary1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Divider(
                height: 5,
                thickness: 1,
                color: EColors.grey,
              ),
              const SizedBox(height: 10),
              _buildTitleContainer('Breakdown of Student Fees by Semester'),
              // _buildTableHeader(),
              const SizedBox(height: 10),
              _buildFeesData(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitleContainer(String title) {
    return Container(
      decoration: BoxDecoration(
        color: EColors.textColorPrimary1.withOpacity(0.7),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        children: [
          CustomTextStyle(
            text: title,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget _buildTableHeader() {
    return Container(
      decoration: BoxDecoration(
        color: EColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: const Row(
        children: [
          SizedBox(width: 8),
          CustomTextStyle(text: 'Semester'),
          SizedBox(width: 15),
          CustomTextStyle(text: 'Per Semester'),
          SizedBox(width: 20),
          CustomTextStyle(text: 'Paid Amount'),
        ],
      ),
    );
  }

  Widget _buildFeesData() {
    return Column(
      children: [
        FeesData(),
      ],
    );
  }
}

class FeesData extends StatelessWidget {
  final List<Map<String, dynamic>> semesterDetails = [
    {
      'Semester': '1',
      'Per Semester': '15000.00',
      'Paid Amount': '20000.00',
      'View More': {
        'Admission Fee': 2000,
        'Student’s Welfare Fund': 750,
        'Modernization': 1500,
        'Library Security Deposit': 4242,
        'Tuition Fee': 45455,
        'Examination': 4242,
        'Registration': 4222
      },
      'Total': 45445
    },
    {
      'Semester': '2',
      'Per Semester': '15000.00',
      'Paid Amount': '20000.00',
      'View More': {
        'Admission Fee': 2000,
        'Student’s Welfare Fund': 750,
        'Modernization': 1500,
        'Library Security Deposit': 4242,
        'Tuition Fee': 45455,
        'Examination': 4242,
        'Registration': 4222
      },
      'Total': 45445
    },
    {
      'Semester': '3',
      'Per Semester': '14000.00',
      'Paid Amount': '40000.00',
      'View More': {
        'Admission Fee': 2000,
        'Student’s Welfare Fund': 750,
        'Modernization': 1500,
        'Library Security Deposit': 4242,
        'Tuition Fee': 45455,
        'Examination': 4242,
        'Registration': 4222
      },
      'Total': 45445
    },
    // Add similar entries for other semesters
  ];

  final Map<String, String> totalDetails = {
    'Total': 'Total',
    'Total Amt': '72000.00',
    'Per Semester total': '30000.00',
    'Paid Amount total': '40000.00',
    'Balance Amount': 'Balance Amount',
    'Total Balance Amount': '1,23,569.00',
  };

  FeesData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var details in semesterDetails)
          _buildFeesDataContainer(details),
        const SizedBox(
          height: 10,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Divider(height: 4),
        ),
        _buildTotalFeesDataContainer(totalDetails),
        _buildTotalFeesDataContainer({
          'Total': 'Balance Amount',
          'Total Amt': '1,23,569.00',
          'Per Semester total': '',
          'Paid Amount total': '',
          'Balance Amount': '',
          'Total Balance Amount': '',
        }),
      ],
    );
  }

  Widget _buildFeesDataContainer(Map<String, dynamic> details) {
    return GestureDetector(
      onTap: () {
        Get.to(() => SemesterFeesScreen(data: details));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Color(0xFFFFE0E5),
          // color: EColors.backgroundColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Color(0xFFFFC1C5),
              offset: Offset(-2, -2),
              blurRadius: 5,
              spreadRadius: 1,
            ),
            BoxShadow(
              color: Colors.white,
              offset: Offset(2, 2),
              blurRadius: 5,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Semester ${details['Semester']}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: EColors.textColorPrimary1,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(
                        Icons.payment,
                        color: Colors.pinkAccent,
                        size: 18,
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          'Per Semester: ₹${details['Per Semester']}',
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: EColors.textColorPrimary1,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.attach_money,
                        color: Colors.pinkAccent,
                        size: 18,
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          'Paid Amount: ₹${details['Paid Amount']}',
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: EColors.textColorPrimary1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.redAccent.shade400,
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xFFFFC1C5),
                    offset: Offset(-2, -2),
                    blurRadius: 5,
                    spreadRadius: 1,
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(5, 5),
                    blurRadius: 5,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: const Icon(
                Icons.arrow_forward_ios,
                color: EColors.backgroundColor,
                size: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTotalFeesDataContainer(Map<String, String> details) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: EColors.backgroundColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.red.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            details['Total'] ?? '',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: EColors.textColorPrimary1,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(
                Icons.payment,
                color: Colors.pinkAccent,
                size: 18,
              ),
              const SizedBox(width: 5),
              Text(
                'Total Amt: ${details['Total Amt']}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: EColors.textColorPrimary1,
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.attach_money,
                color: Colors.pinkAccent,
                size: 18,
              ),
              const SizedBox(width: 5),
              Text(
                'Per Semester total: ${details['Per Semester total']}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: EColors.textColorPrimary1,
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.monetization_on,
                color: Colors.pinkAccent,
                size: 18,
              ),
              const SizedBox(width: 5),
              Text(
                'Paid Amount total: ${details['Paid Amount total']}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: EColors.textColorPrimary1,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(
                Icons.account_balance_wallet,
                color: Colors.pinkAccent,
                size: 18,
              ),
              const SizedBox(width: 5),
              Expanded(
                child: Text(
                  'Balance Amount: ${details['Balance Amount']}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: EColors.textColorPrimary1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 2,
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.money_off,
                color: Colors.pinkAccent,
                size: 18,
              ),
              const SizedBox(width: 5),
              Expanded(
                child: Text(
                  'Total Balance Amount: ${details['Total Balance Amount']}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: EColors.textColorPrimary1,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
 */
