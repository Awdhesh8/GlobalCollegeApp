import 'package:flutter/material.dart';
import 'package:globalcollegeapp/features/home/screens/left_circle_menu_and_screens/library/book_data/book_data_class.dart';
import '../../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../../common/widgets/texts/top_first_heading.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/sizes.dart';
import 'book_history_widget/book_history_contanier.dart';

class BookHistoryScreen extends StatelessWidget {
  const BookHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EColors.backgroundColor,
      appBar: const GAppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Library History',
          style: TextStyle(
            color: EColors.textColorPrimary1,
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        ),
        centerTitle: true,
        showBackArrow: true,
      ),

      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            // SizedBox(
            //   height: ESizes.spaceBtwSections + 44,
            // ),

            /// Title Heading for Books History
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 22),
                  child: TopHeading(
                    text: 'A Historical View of\nYour Checked-Out\nCollection',
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: ESizes.spaceBtwItems,
            ),

            // Container with Book History Data
            /// Container with Book Data
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: BookData.books.map((bookData) {
                  return BookHistoryContainer(bookData: bookData);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
