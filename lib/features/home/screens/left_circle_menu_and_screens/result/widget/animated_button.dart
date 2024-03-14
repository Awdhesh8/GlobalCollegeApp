import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class BouncyButton extends StatefulWidget {
  final String label;
  // final String iconPath;
  final Function onPressed;

  const BouncyButton({
    Key? key,
    required this.label,
    // required this.iconPath,
    required this.onPressed,
  }) : super(key: key);

  @override
  _BouncyButtonState createState() => _BouncyButtonState();
}

class _BouncyButtonState extends State<BouncyButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 150),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() async {
    await _controller.forward();
    await _controller.reverse();
    widget.onPressed();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.scale(
            scale: 1 - (_controller.value * 0.1),
            child: child,
          );
        },
        child: Container(
          // width: 200,
          // height: 60,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SvgPicture.asset(
              //   widget.iconPath,
              //   width: 24,
              //   height: 24,
              //   color: Colors.white,
              // ),
              // SizedBox(width: 10),
              Text(
                widget.label,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
