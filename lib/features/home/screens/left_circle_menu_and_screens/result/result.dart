import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/texts/top_first_heading.dart';
import '../../../../../utils/constants/colors.dart';

class Result extends StatelessWidget {
  const Result({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EColors.backgroundColor,

      /// App Bar
      appBar: GAppBar(
        backgroundColor: Colors.transparent,
        showBackArrow: true,
        title: Text(
          'Result',
          style: TextStyle(
            fontSize: 20.0,
            fontFamily: 'Inter',
            color: EColors.textColorPrimary1,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),

      /// Body --->

      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: [
              /// Top Heading
              TopHeading(
                fontSize: 20,
                text: 'Your Academic \nScorecard is Here 📊',
              ),
              
              ///
              ElevatedButton(onPressed: () => Get.to(() => NewScreen()), child: Text('data'))
            ],
          ),
        ),
      ),
    );
  }
}

class NewScreen extends StatelessWidget {
  const NewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GAppBar(
        title: Text('New Animation'),
      ),
      body: SingleChildScrollView(
        child: AnimatedGradientRectangle(),
      ),
    );
  }
}


class AnimatedGradientRectangle extends StatefulWidget {
  @override
  _AnimatedGradientRectangleState createState() =>
      _AnimatedGradientRectangleState();
}

class _AnimatedGradientRectangleState extends State<AnimatedGradientRectangle>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    )..repeat();

    _animation = Tween<double>(
      begin: 0.0,
      end: 2 * pi,
    ).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(20.0),
            gradient: SweepGradient(
              colors: [
                Colors.blue.shade200,
                Colors.green.shade200,
                Colors.yellow.shade200,
                Colors.red.shade200,
              ],
              stops: [0.0, 0.25, 0.5, 0.75],
              startAngle: _animation.value,
              endAngle: _animation.value + pi / 2,
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}