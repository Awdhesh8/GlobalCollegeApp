import 'package:flutter/material.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/sizes.dart';

class PersonalInformationScreen extends StatelessWidget {
  const PersonalInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: GAppBar(
        showBackArrow: true,
        title: Text('Personal Information'),
      ),

      // Body ---
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(ESizes.defaultSpace),
          child: Column(
            children: [

              /*
              const Column(
                children: [
                  ECircularImage(
                    fit: BoxFit.cover,
                    image: EImages.userIcon,
                    width: 100,
                    height: 100,
                  ),
                ],
              ),

              // Details --->
              const SizedBox(height: ESizes.spaceBtwItems / 2,),
              const Divider(),
              const SizedBox(height: ESizes.spaceBtwItems),
              const ESectionHeading(title: 'Your Details', showActionButton: false,),

              const SizedBox(height: ESizes.spaceBtwItems),

              // Heading Profile Info
              // const ESectionHeading(title: 'Profile Information', showActionButton: false,),
              // const SizedBox(height: ESizes.spaceBtwItems),

              EProfileMenu(onPressed: () {  }, value: 'G/2023/Engg/CS/56', title: 'G No',),
              EProfileMenu(onPressed: () {  }, value: '121CS12024', title: 'Enrollment Number',),

              // const SizedBox(height: ESizes.spaceBtwItems),
              // const Divider(),
              // const SizedBox(height: ESizes.spaceBtwItems),

              // const ESectionHeading(title: 'Profile Details', showActionButton: false,),
              // const SizedBox(height: ESizes.spaceBtwItems),

              EProfileMenu(onPressed: () {  }, value: 'Elon musk father', title: 'Fathers Name',),
              EProfileMenu(onPressed: () {  }, value: 'Musk mother', title: 'Mothers Name',),
              EProfileMenu(onPressed: () {  }, value: 'Jan 01 2000', title: 'Date Of Birth',),
              EProfileMenu(onPressed: () {  }, value: '9898987777', title: 'Contact No',),
              EProfileMenu(onPressed: () {  }, value: 'Engg', title: 'Course',),
              EProfileMenu(onPressed: () {  }, value: 'CS', title: 'Branch',),
              EProfileMenu(onPressed: () {  }, value: 'Jabalpur, M.P., 482001', title: 'Address',),
              EProfileMenu(onPressed: () {  }, value: '7979797979', title: 'Parent Contact',),
              EProfileMenu(onPressed: () {  }, value: 'google@gmail.com', title: 'Email',),
              EProfileMenu(onPressed: () {  }, value: 'General', title: 'Category',),
              EProfileMenu(onPressed: () {  }, value: 'A+r', title: 'Blood Group',),
              EProfileMenu(onPressed: () {  }, value: '12457879879', title: 'Aadhaar Numb',),
              EProfileMenu(onPressed: () {  }, value: '121JBP45', title: 'Samarga Id',),
              EProfileMenu(onPressed: () {  }, value: 'Space Exploration', title: 'Hobbies',),
              EProfileMenu(onPressed: () {  }, value: 'Logical Thinking', title: 'Strength',),
              EProfileMenu(onPressed: () {  }, value: 'Emotional', title: 'Weakness',),

              const SizedBox(height: ESizes.spaceBtwItems),

              // Close Account Button
              // Center(
              //   child: TextButton(
              //     onPressed: () {},
              //     child: const Text('Close Account', style: TextStyle(color: Colors.red),),
              //   ),
              // ),
            ],
          ),

               */
    ],
        ),
      ),
      ),
    );
  }
}

