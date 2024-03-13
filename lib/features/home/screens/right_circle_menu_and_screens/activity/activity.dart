import 'package:flutter/material.dart';
import 'package:globalcollegeapp/utils/constants/teext_styles.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class Activity extends StatelessWidget {
  const Activity({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EColors.backgroundColor,
      appBar: GAppBar(
        backgroundColor: Colors.transparent,
        showBackArrow: true,
        centerTitle: false,
        title: Text(
          'Activities',
          style: TextStyleClass.appBarTextStyle
        ),
      ),
      body: DefaultTabController(
        length: 5,
        child: Column(
          children: [
            Flexible(
              child: Row(
                children: [
                  Flexible(
                    child: TabBarView(
                      children: [
                        // Content for Category 1
                        SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            children: [
                             // StackContainer(),
                             //  ContainerStack(),
                              SizedBox(
                                height: 15,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  height: 220,
                                  width: 220,
                                  color: Colors.red.shade50,
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  height: 220,
                                  width: 220,
                                  color: Colors.blue.shade50,
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  height: 220,
                                  width: 220,
                                  color: Colors.red.shade50,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Content for Category 2
                        Stack(
                         children: [
                           Container(
                             child: const Center(
                               child: Text('Category 2 content'),
                             ),
                           ),
                         ],
                        ),
                        // Content for Category 3
                        Container(
                          child: const Center(
                            child: Text('Category 3 content'),
                          ),
                        ),
                        // Add more TabBarView children as needed
                        Container(
                          child: const Center(
                            child: Text('Category 4 content'),
                          ),
                        ),
                        // Add more TabBarView children as needed
                        Container(
                          child: const Center(
                            child: Text('Category 5 content'),
                          ),
                        ),
                        // Add more TabBarView children as needed
                      ],
                    ),
                  ),
                  RotatedBox(
                    quarterTurns: 9,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        constraints: const BoxConstraints.expand(
                            height: 50, width: double.maxFinite),
                        child: const TabBar(
                          isScrollable: true,
                          dividerColor: Colors.transparent,
                          indicator: DotTabIndicator(
                            color: Colors.redAccent,
                            radius: 4,
                          ),
                          tabs: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Tab(text: 'Global Youth Fest 2023'),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Tab(text: 'Global College Yoga Day'),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Tab(text: 'Engineering'),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Tab(text: 'Category 4'),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              child: Tab(text: 'Category 5'),
                            ),
                            // Add more tabs as needed
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StackContainer extends StatelessWidget {
  final Widget? child;
  const StackContainer({
    super.key, this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SizedBox(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 6),
              child: Transform.rotate(
                angle: .03,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 214,
                    // width: 310,
                    color: Colors.deepPurple.shade100,
                    // color: Colors.blue.shade50,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4, left: 2),
              child: Transform.rotate(
                angle: - .03,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 180,
                    // width: 310,
                    //color: Colors.orange.shade800,
                     color: Colors.blue.shade100,
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}

class DotTabIndicator extends Decoration {
  final Color color;
  final double radius;

  const DotTabIndicator({required this.color, required this.radius});

  @override
  _DotPainter createBoxPainter([VoidCallback? onChanged]) {
    return _DotPainter(this, onChanged);
  }
}

class _DotPainter extends BoxPainter {
  final DotTabIndicator decoration;

  _DotPainter(this.decoration, VoidCallback? onChanged) : super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Paint paint = Paint()..color = decoration.color;
    final Rect rect = offset & configuration.size!;
    final double centerX = rect.center.dx;
    final double bottom = rect.bottom - 6; // Adjust the value based on your preference

    canvas.drawCircle(Offset(centerX, bottom), decoration.radius, paint);
  }
}


class ContainerStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200, // Change this according to your requirement
      height: 200, // Change this according to your requirement
      child: Stack(
        children: [
          Container(
            color: Colors.blue,
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 100, // Change this according to your requirement
                  height: 100, // Change this according to your requirement
                  color: Colors.green,
                ),
                Container(
                  width: 100, // Change this according to your requirement
                  height: 100, // Change this according to your requirement
                  color: Colors.red,
                ),
                Container(
                  width: 100, // Change this according to your requirement
                  height: 100, // Change this according to your requirement
                  color: Colors.yellow,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}




// import 'package:flutter/material.dart';
// import '../../../../../common/widgets/appbar/appbar.dart';
// import '../../../../../utils/constants/colors.dart';
// import '../../../../../utils/constants/sizes.dart';
//
// class Activity extends StatelessWidget {
//   const Activity({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: EColors.backgroundColor,
//       appBar: GAppBar(
//         backgroundColor: Colors.transparent,
//         showBackArrow: true,
//         title: Text(
//           'Activities',
//           style: TextStyle(
//             fontSize: ESizes.appTitle,
//             fontFamily: 'Inter',
//             color: EColors.primary,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//       ),
//       body: Column(
//         children: [
//
//
//         ],
//       ),
//     );
//   }
// }
//

/*
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:globalcollegeapp/features/home/screens/right_circle_menu_and_screens/activity/widget/dot_indicator.dart';
import 'package:globalcollegeapp/utils/constants/colors.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../utils/constants/sizes.dart';
import 'model/model.dart';

class Activity extends StatelessWidget {
  final PageController _pageController = PageController();
  final RxInt _currentPage = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: EColors.backgroundColor,
      backgroundColor: EColors.black,
      appBar: const GAppBar(
        backgroundColor: Colors.transparent,
        showBackArrow: true,
        title: Text(
          'Activities',
          style: TextStyle(
            fontSize: ESizes.appTitle,
            fontFamily: 'Inter',
            color: EColors.primary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              _currentPage.value = page;
            },
            scrollDirection: Axis.vertical, // Set scroll direction to vertical
            children: eventData.map((event) {
              return _buildEventCard(context, event);
            }).toList(),
          ),
          DotIndicator(pageCount: eventData.length, currentPage: _currentPage),
        ],
      ),
    );
  }

  Widget _buildEventCard(BuildContext context, Map<String, dynamic> event) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage(event['image']),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.0),
                  Colors.black.withOpacity(0.0),
                  Colors.black.withOpacity(0.1),
                  Colors.black.withOpacity(0.3),
                  Colors.black.withOpacity(0.6),
                  Colors.black.withOpacity(1.0),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: FractionallySizedBox(
              widthFactor: 1.0,
              heightFactor: 0.3, // Adjust this factor as needed
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  color: Colors.transparent,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        event['type'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Venue: ${event['venue']}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Date & Time: ${event['dateTime']}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextButton(
                        onPressed: () {
                          _viewImageFullScreen(context, event['image']);
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'View Image',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  void _viewImageFullScreen(BuildContext context, String imagePath) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            Scaffold(
              backgroundColor: Colors.black,
              body: Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(onPressed: (){
                                Navigator.pop(context);
                              }, icon: const Icon(FontAwesomeIcons.doorClosed, color: Colors.white,)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Hero(
                            tag: 'imageHero',
                            child: Image.asset(
                              imagePath,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
      ),
    );
  }

}
 */

/*

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:globalcollegeapp/utils/constants/colors.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import 'model/model.dart';

class Activity extends StatelessWidget {
  const Activity({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EColors.backgroundColor,
      appBar: GAppBar(
        backgroundColor: Colors.transparent,
        showBackArrow: true,
        title: Text('Party Events'),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: eventData.map((event) {
            return _buildEventCard(event);
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildEventCard(Map<String, dynamic> event) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 380,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: AssetImage(event['image']),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.0),
                    Colors.black.withOpacity(0.0),
                    Colors.black.withOpacity(0.1),
                    Colors.black.withOpacity(0.3),
                    Colors.black.withOpacity(0.6),
                    Colors.black.withOpacity(1.0),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: FractionallySizedBox(
                widthFactor: 1.0,
                heightFactor: 0.3, // Adjust this factor as needed
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    color: Colors.transparent,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          event['type'],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Venue: ${event['venue']}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Date & Time: ${event['dateTime']}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


 */

// import 'package:flutter/material.dart';
// import 'package:globalcollegeapp/utils/constants/colors.dart';
// import '../../../../../common/widgets/appbar/appbar.dart';
//
// class Activity extends StatelessWidget {
//   const Activity({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       backgroundColor: EColors.backgroundColor,
//       appBar: GAppBar(
//         backgroundColor: Colors.transparent,
//         showBackArrow: true,
//         title: Text('Activity'),
//       ),
//
//       body: SingleChildScrollView(
//         physics: BouncingScrollPhysics(),
//         child: Column(
//           children: [
//
//             ///
//
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
