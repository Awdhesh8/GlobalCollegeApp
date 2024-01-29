import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:globalcollegeapp/common/widgets/appbar/appbar.dart';
import 'package:globalcollegeapp/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:globalcollegeapp/utils/constants/sizes.dart';
import '../../../../../common/widgets/book_contanier/book_contanier.dart';
import '../../../../../common/widgets/custom_container_button/custom_container_button.dart';
import '../../../../../common/widgets/texts/top_first_heading.dart';
import '../../../../../utils/constants/colors.dart';
import 'e_library/e_library.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EColors.backgroundColor,
      appBar: const GAppBar(
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
          const ESearchContainer(
            text: 'Search Books',
          ),

          const SizedBox(
            height: ESizes.spaceBtwItems,
          ),

          /// Three Buttons eLibrary | Issued Book | History
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomContainerButton(
                  buttonText: 'eLibrary',
                  onTap: () {
                    Get.to(() => const ELibraryScreen());
                  },
                ),
                const CustomContainerButton(
                  buttonText: 'Issued Books',
                ),
                const CustomContainerButton(
                  buttonText: 'History',
                ),
              ],
            ),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Divider(),
          ),
          const SizedBox(
            height: ESizes.spaceBtwItems1,
          ),

          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  /// Title Heading for Books
                  const Row(
                    children: [
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 22),
                          child: TopHeading(
                            text:
                                'Unveiling Our Newest\nArrivals: Dive into\nFresh Reads',
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: ESizes.spaceBtwItems,
                  ),

                  /// Showcase Library Books
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomContainer(
                        imageUrl: bookImages.first,
                      ),
                      CustomContainer(
                        imageUrl: bookImages.elementAt(1),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: ESizes.spaceBtwItems,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomContainer(
                        imageUrl: bookImages.elementAt(2),
                      ),
                      CustomContainer(
                        imageUrl: bookImages.elementAt(3),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: ESizes.spaceBtwItems,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Sample list of image URLs (replace these with your actual image URLs)
final List<String> bookImages = [
  'assets/books/1book.jpg',
  'assets/books/2book.jpg',
  'assets/books/3book.jpg',
  'assets/books/4book.jpg',
  'assets/books/1book.jpg',
  'assets/books/2book.jpg',
  'assets/books/3book.jpg',
  'assets/books/4book.jpg',
  // Add more image URLs as needed
];