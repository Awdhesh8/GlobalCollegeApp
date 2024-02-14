import 'package:flutter/material.dart';
import 'package:globalcollegeapp/common/widgets/appbar/appbar.dart';
import 'package:globalcollegeapp/utils/constants/colors.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../../common/widgets/book_contanier/book_contanier.dart';
import '../../../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../../../common/widgets/texts/top_first_heading.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../book_data/book_data_class.dart';
import 'book_widget/e_book_widget.dart';
import 'e_book_contanier/e_book_contanier.dart';

class ELibraryScreen extends StatelessWidget {
  const ELibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Book data
    final List<Map<String, dynamic>> books = [
      {
        'imageUrl': 'assets/books/1book.jpg',
        'title': 'Space Forces',
        'description':
            'This is an amazing book, This book winner of the Nobel Prize for Physics',
        'author': 'Author Name here',
        'availableQty': 10,
         'issueDate' : 'Jan 20 2024',
         'issueTime' : '10:30 AM',
        'returnDate' : 'Jan 20 2024',
         'returnTime' : '10:30 AM',
        'downloadLink':
            'https://web.pdx.edu/~pmoeck/books/Tipler_Llewellyn.pdf',
      },
      {
        'imageUrl': 'assets/books/2book.jpg',
        'title': 'Chemistry Wonders',
        'description':
            'Explore the wonders of chemistry with this insightful book',
        'author': 'Chemist Extraordinaire',
        'availableQty': 5,
        'issueDate' : 'Jan 20 2024',
        'issueTime' : '10:30 AM',
        'returnDate' : 'Jan 20 2024',
        'returnTime' : '10:30 AM',
        'downloadLink':
            'https://web.pdx.edu/~pmoeck/books/Tipler_Llewellyn.pdf',
      },
      {
        'imageUrl': 'assets/books/2book.jpg',
        'title': 'Chemistry Wonders',
        'description':
            'Explore the wonders of chemistry with this insightful book',
        'author': 'Chemist Extraordinaire',
        'availableQty': 5,
        'issueDate' : 'Jan 20 2024',
        'issueTime' : '10:30 AM',
        'returnDate' : 'Jan 20 2024',
        'returnTime' : '10:30 AM',
        'downloadLink':
            'https://web.pdx.edu/~pmoeck/books/Tipler_Llewellyn.pdf',
      },
      {
        'imageUrl': 'assets/books/2book.jpg',
        'title': 'Chemistry Wonders',
        'description':
            'Explore the wonders of chemistry with this insightful book',
        'author': 'Chemist Extraordinaire',
        'availableQty': 5,
        'issueDate' : 'Jan 20 2024',
        'issueTime' : '10:30 AM',
        'returnDate' : 'Jan 20 2024',
        'returnTime' : '10:30 AM',
        'downloadLink':
            'https://web.pdx.edu/~pmoeck/books/Tipler_Llewellyn.pdf',
      },
      // Add more books here...
    ];

    return Scaffold(
      backgroundColor: EColors.backgroundColor,
      appBar: const GAppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'eLibrary',
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
            const SizedBox(
              height: ESizes.spaceBtwSections + 44,
            ),

            /// Title Heading for Books
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 22),
                  child: TopHeading(
                    text: 'Digital Bookshelf:\nBrowse & Enjoy',
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: ESizes.spaceBtwItems,
            ),

            // Container with e-Book Data
            /// Container with e-Book Data
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: BookData.books.map((bookData) {
                  return EBookDetailsContainer(bookData: bookData);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      floatingActionButton: const Padding(
        padding: EdgeInsets.only(top: 66),
        child: CustomSearchContainer(
          showBackground: true,
          dark: false,
          showBorder: true,
        ),
      ),
    );
  }
}

final List<String> defaultEBookImages = [
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
