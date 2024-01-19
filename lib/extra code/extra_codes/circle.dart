import 'package:flutter/material.dart';
import '../../utils/constants/colors.dart';

class CustomCircle extends StatelessWidget {

  final width;
  final height;
  
  const CustomCircle({
    Key? key, required this.width, required this.height,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        Stack(
          children: [
          Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color.fromRGBO(255, 226, 226, 1),
            border: Border.all(
              width: 8,
              color: Colors.white,
              style: BorderStyle.solid,
            ),
            // boxShadow: [
            //   BoxShadow(
            //     color: const Color(0x1C000000).withOpacity(0.11),
            //     blurRadius: 3.90,
            //     offset: const Offset(0, 0),
            //     spreadRadius: 0,
            //   ),
            // ],
          ),
        ),

            // const Positioned(
            //   top: 60,
            //   left: 10,
            //   child: Text('82%',style: TextStyle(color: Color(0xFFFE1535),fontSize: 40,fontWeight: FontWeight.bold),),
            // ),
            // const Positioned(
            //   top: 110,
            //   left: 15,
            //   child: Text('ATTENDANCE',style: TextStyle(fontSize: 10),),
            // ),

            const Positioned(
              top: 45,
              right: 25,
              child: Text('14',style: TextStyle(color: EColors.textPrimaryHeading,fontSize: 37,fontWeight: FontWeight.bold),),
            ),
            const Positioned(
              top: 90,
              right: 25,
              child: Text('RANKING',style: TextStyle(fontSize: 10, color: EColors.textSecondaryTitle, fontWeight: FontWeight.w600),),
            ),
          ],
        );
  }
}


class CustomCircle2 extends StatelessWidget {

  final width;
  final height;

  const CustomCircle2({
    Key? key, required this.width, required this.height,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Stack(
        children: [
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color.fromRGBO(255, 226, 226, 1),
              border: Border.all(
                width: 8,
                color: Colors.white,
                style: BorderStyle.solid,
              ),
              // boxShadow: [
              //   BoxShadow(
              //     color: const Color(0x1C000000).withOpacity(0.11),
              //     blurRadius: 3.90,
              //     offset: const Offset(0, 0),
              //     spreadRadius: 0,
              //   ),
              // ],
            ),
          ),
          const Positioned(
            top: 45,
            left: 21,
            child: Text('82%',style: TextStyle(color:  EColors.textPrimaryHeading,fontSize: 32,fontWeight: FontWeight.bold),),
          ),
          const Positioned(
            top: 90,
            left: 15,
            child: Text('ATTENDANCE',style: TextStyle(fontSize: 10, color: EColors.textSecondaryTitle, fontWeight: FontWeight.w600),),
          ),
          // const Positioned(
          //   top: 35,
          //   right: 25,
          //   child: Text('14',style: TextStyle(color: Color(0xFFFE1535),fontSize: 40,fontWeight: FontWeight.bold),),
          // ),
          // const Positioned(
          //   top: 80,
          //   right: 25,
          //   child: Text('RANKING',style: TextStyle(fontSize: 10),),
          // ),
        ],
      );
  }
}
