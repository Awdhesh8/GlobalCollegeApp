import 'dart:math';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';


class Attendance extends StatelessWidget {
  const Attendance({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.2,
        backgroundColor: const Color.fromRGBO(250, 170, 147, 1),
        title:
        Row(
          children: [
            Image.asset(
              'assets/logo/logo_globalcollege.png',
              width: 60,
            ),
            const SizedBox(width: 65,),
            const Text("Attendance",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold,letterSpacing: 1),),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Iconsax.note, color: Colors.white,),
            color: Colors.white,
          )
        ],
      ),
    );
  }
}













