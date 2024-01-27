import 'package:flutter/material.dart';
import 'package:globalcollegeapp/common/widgets/appbar/appbar.dart';
import 'package:globalcollegeapp/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:globalcollegeapp/utils/constants/colors.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: EColors.backgroundColor,
      appBar: GAppBar(
        backgroundColor: Colors.transparent,
        showBackArrow: true,
        centerTitle: true,
        title: Text(
          'Library',
          style: TextStyle(
              color: EColors.textColorPrimary1,
              fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        ),
      ),

      body: Column(
        children: [
          /// Search bar
          ESearchContainer(text: 'Search', ),
        ],
      ),


    );
  }
}
