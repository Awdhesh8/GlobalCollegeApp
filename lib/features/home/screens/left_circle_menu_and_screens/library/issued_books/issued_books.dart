import 'package:flutter/material.dart';
import '../../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../../common/widgets/texts/top_first_heading.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../book_data/book_data_class.dart';
import 'issue_book_widget/issue_book_contanier.dart';

class IssuedBooksScreen extends StatelessWidget {
  const IssuedBooksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EColors.backgroundColor,
      appBar: const GAppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Borrowed Books',
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

            /// Title Heading for Issued Books
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 22),
                  child: TopHeading(
                    text: 'Your Borrowed\nTitles',
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: ESizes.spaceBtwItems,
            ),

            // Container with Issued Book Data
            /// Container with Issued Book Data
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: BookData.books.map((bookData) {
                  return IssuedBookDetailsContainer(bookData: bookData);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
