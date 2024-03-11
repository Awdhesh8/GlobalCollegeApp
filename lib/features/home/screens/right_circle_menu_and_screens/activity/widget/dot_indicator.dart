// dot_indicator.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DotIndicator extends StatelessWidget {
  final int pageCount;
  final RxInt currentPage;

  const DotIndicator({
    Key? key,
    required this.pageCount,
    required this.currentPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 30.0,
      top: MediaQuery.of(context).size.height / 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          pageCount,
              (index) => Obx(() => Container(
            width: 8.0,
            height: currentPage.value == index ? 30.0 : 12,
            margin: const EdgeInsets.symmetric(vertical: 4.0),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(50),
              color: Colors.blue.withOpacity(currentPage.value == index ? 0.9 : 0.4),
            ),
          )),
        ),
      ),
    );
  }
}
