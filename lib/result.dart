import 'package:flutter/material.dart';
import 'package:globalcollegeapp/graph/bar_graph.dart';
import 'package:iconsax/iconsax.dart';


class AcademicResult extends StatefulWidget {
  const AcademicResult({super.key});

  @override
  State<AcademicResult> createState() => _AcademicResultState();
}

class _AcademicResultState extends State<AcademicResult> {

  // List
  List<double> summary = [
    4.40,
    2.50,
    42.42,
    10.50,
    100.20,
    88.99,
    90.10,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[300],
      appBar: AppBar(
        elevation: 0.2,
        // backgroundColor: const Color(0xFFFE1535),
        //  backgroundColor: Colors.white,
        backgroundColor: const Color.fromRGBO(250, 170, 147, 1),

        title:
        Row(
          children: [
            Image.asset(
              'assets/logo/logo_globalcollege.png',
              width: 60,
            ),
            const SizedBox(width: 45,),
            const Text("Result",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold,letterSpacing: 1),),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Iconsax.note_favorite5, color: Colors.white,),
            color: Colors.white,
          )
        ],
      ),
      body: Center(
        child: SizedBox(
            height: 200,
            width: 300,
            child: MyBarGraph(semSummary: summary,
            ),
        ),
      ),
    );
  }
}
