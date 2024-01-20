import 'package:flutter/material.dart';
import 'package:globalcollegeapp/features/home/screens/profile_card/widgets/profile_card_back_side/profile_card_back_side.dart';
import 'package:globalcollegeapp/features/home/screens/profile_card/widgets/profile_card_front_side/profile_front_side_card.dart';
import '../../../../utils/constants/colors.dart';
import 'package:flip_card/flip_card.dart';

class ProfileBox extends StatefulWidget {
  const ProfileBox({Key? key}) : super(key: key);

  @override
  State<ProfileBox> createState() => _ProfileBoxState();
}

class _ProfileBoxState extends State<ProfileBox> {
  @override
  Widget build(BuildContext context) {
    return FlipCard(
      direction: FlipDirection.VERTICAL, // Flip direction
      flipOnTouch: true,
      front: buildFront(),
      back: buildBack(),
    );
  }

  Widget buildFront() {
    double containerWidth = MediaQuery.of(context).size.width * 0.9;
    return Column(
      children: [
        Container(
          width: containerWidth,
          height: 125,
          decoration: BoxDecoration(
            color: EColors.primarySecond,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                offset: Offset(0, 0),
                blurRadius: 10,
                color: Colors.black12,
              )
            ],
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.all(0),
            child: const UserProfileWidget(
              imageUrl:
                  'assets/avaters/Avatar 6.jpg', // Replace with your image URL
              name: 'Surya Pratap Singh',
              branch: 'Computer Science Engineering',
              courseType: 'Bachelor', enroll: '121ME2024CS',
            ),
          ),
        ),
      ],
    );
  }

  Widget buildBack() {
    // Back side of the card here
    return const UserDetailsWidget(
      name: 'Surya Pratap Singh', // Replace with your name from API
      enrollmentNumber:
          '1201ME2024', // Replace with your enrollment number from API
      semester: '2nd sem', // Replace with your semester from API
      branch: 'Computer Science', // Replace with your branch from API
    );
  }
}
