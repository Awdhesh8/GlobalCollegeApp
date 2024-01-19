import 'package:flutter/material.dart';
import '../../../../utils/constants/colors.dart';
import '../curved_edges/curved_edges_widget.dart';
import 'circular_contanier.dart';

class EPrimaryHeaderContainer extends StatelessWidget {
  const EPrimaryHeaderContainer({
    super.key, required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ECurvedEdgeWidget(
      child: Container(
        color: EColors.primarySecond,
        padding: const EdgeInsets.all(0),
        child: Stack(
          children: [

            // Background Custom Shapes
            Positioned(top: -150, right: -250,child: ECircularContainer(backgroundColor: EColors.textWhite.withOpacity(0.1),)),
            Positioned(top: 100, right: -300,child: ECircularContainer(backgroundColor: EColors.textWhite.withOpacity(0.1),)),
            child,
          ],
        ),
      ),
    );
  }
}
