import 'package:flutter/material.dart';

class FeesCard extends StatelessWidget {
  const FeesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 303,
      height: 179,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x26000000),
            blurRadius: 10.90,
            offset: Offset(0, 0),
            spreadRadius: 0,
          )
        ],
      ),
      child: const Column(
        children: [
          Row(
            children: [
              Text('data'),
            ],
          ),
          Row(
            children: [
              Text('data'),
            ],
          ),
          Row(
            children: [
              Text('data'),
            ],
          ),
        ],
      ),
    );
  }
}
