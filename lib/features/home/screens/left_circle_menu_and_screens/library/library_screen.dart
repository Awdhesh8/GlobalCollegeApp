import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:globalcollegeapp/common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../../common/layouts/grid_layout.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_container_button/custom_container_button.dart';
import '../../../../../common/widgets/texts/top_first_heading.dart';
import '../../../../../data/api/api_services.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import 'book_contaner/book_contanier.dart';
import 'e_library/e_library.dart';
import 'history/book_history.dart';
import 'issued_books/issued_books.dart';

class LibraryScreen extends StatefulWidget {
  @override
  _LibraryScreenState createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  List<Map<String, dynamic>> books = [];
  TextEditingController searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  bool isLoading = false;
  bool _showScrollToTopButton = false;

  @override
  void initState() {
    super.initState();
    // Call the bookSearch function when the screen initializes
    bookSearch('');

    _scrollController.addListener(() {
      // Check if the user has scrolled down to show the FloatingActionButton
      if (_scrollController.offset >= 300) {
        // Assuming you want to show the button when scrolled down 300 pixels
        setState(() {
          _showScrollToTopButton = true;
        });
      } else {
        setState(() {
          _showScrollToTopButton = false;
        });
      }
    });
  }

  void _scrollToTop() {
    _scrollController.animateTo(0.0,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }

  Future<void> bookSearch(String searchKeyword) async {
    try {
      setState(() {
        isLoading = true;
      });

      List<Map<String, dynamic>> result =
          await ApiService.bookSearch(searchKeyword);

      setState(() {
        books = result;
        isLoading = false;
      });
    } catch (error) {
      print('Error: $error');
      setState(() {
        isLoading = false;
      });
    }
  }

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
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            CustomSearchContainer(
              showBackground: true,
              dark: false,
              showBorder: true,
              onChanged: (value) {
                // Call bookSearch function whenever the search text changes
                bookSearch(value);
              },
              controller: searchController,
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
                      Get.to(() => const ELibraryScreen(),
                          curve: Curves.easeInOut,
                          transition: Transition.cupertino);
                    },
                  ),
                  CustomContainerButton(
                    buttonText: 'Issued Books',
                    onTap: () {
                      Get.to(() => const IssuedBooksScreen(),
                          curve: Curves.easeInOut,
                          transition: Transition.cupertino);
                    },
                  ),
                  CustomContainerButton(
                    buttonText: 'History',
                    onTap: () {
                      Get.to(() => const BookHistoryScreen(),
                          curve: Curves.easeInOut,
                          transition: Transition.cupertino);
                    },
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
            isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: EGridLayout(
              itemCount: books.length,
              mainAxisExtent: 268,
              itemBuilder: (context, index) {
                var book = books[index];
               return ReadingListCard(
                    imageUrl: book['covor_image'],
                    title: book['book_title'],
                    author: book['author'],
                    availableQty: book['available_qty'],
                    lockStatus: book['lock_status'],
                );
                  // var book = books[index];
                  // return BookContainer(
                  //   imageUrl: book['covor_image'],
                  //   title: book['book_title'],
                  //   author: book['author'],
                  //   availableQty: book['available_qty'],
                  //   lockStatus: book['lock_status'],
                  // );
              },
            ),
                ),
            const SizedBox(
              height: ESizes.spaceBtwItems1,
            ),
          ],
        ),
      ),
      floatingActionButton: _showScrollToTopButton
          ? FloatingActionButton(
              onPressed: _scrollToTop,
              tooltip: 'Scroll to Top',
              child: const Icon(Icons.arrow_upward),
            )
          : null,
    );
  }
}

class BookTile extends StatelessWidget {
  final Map<String, dynamic> book;

  BookTile({required this.book});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            book['covor_image'],
            height: 80.0,
            width: 80.0,
          ),
          const SizedBox(height: 8.0),
          Expanded(
              child: Text(
            book['book_title'],
            style: const TextStyle(
                // overflow: TextOverflow.ellipsis
                ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          )),
          const SizedBox(height: 4.0),
          Expanded(child: Text(book['author'])),
          const SizedBox(height: 4.0),
          Text('Available Qty: ${book['available_qty']}'),
          const SizedBox(height: 8.0),
          Switch(
            value: book['lock_status'] == 'True',
            onChanged: (bool value) {
              // Implement logic to update lock status on the server
              // You might need to make an API call to update this status
              // based on the book['title_id'] and value (true/false)
            },
          ),
        ],
      ),
    );
  }
}

/*
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:globalcollegeapp/common/widgets/appbar/appbar.dart';
import 'package:globalcollegeapp/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:globalcollegeapp/utils/constants/sizes.dart';
import '../../../../../common/widgets/book_contanier/book_contanier.dart';
import '../../../../../common/widgets/custom_container_button/custom_container_button.dart';
import '../../../../../common/widgets/texts/top_first_heading.dart';
import '../../../../../data/api/api_services.dart';
import '../../../../../utils/constants/colors.dart';
import 'book_contaner/book_contanier.dart';
import 'e_library/e_library.dart';
import 'history/book_history.dart';
import 'issued_books/issued_books.dart';

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
          const CustomSearchContainer(
            showBackground: true,
            dark: false,
            showBorder: true,
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
                    Get.to(() => const ELibraryScreen(),
                        curve: Curves.easeInOut,
                        transition: Transition.cupertino);
                  },
                ),
                CustomContainerButton(
                  buttonText: 'Issued Books',
                  onTap: () {
                    Get.to(() => const IssuedBooksScreen(),
                        curve: Curves.easeInOut,
                        transition: Transition.cupertino);
                  },
                ),
                CustomContainerButton(
                  buttonText: 'History',
                  onTap: () {
                    Get.to(() => const BookHistoryScreen(),
                        curve: Curves.easeInOut,
                        transition: Transition.cupertino);
                  },
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
                  /// Showcase Library Books
                  /// Showcase Library Books
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: FutureBuilder<List<Book>>(
                      future: ApiService.fetchBooksData(" "),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          // If the Future is still running, display a loading indicator
                          return CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          // If the Future throws an error, display an error message
                          return Text('Error: ${snapshot.error}');
                        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                          // If the Future is completed but no data is available
                          return Text('No books found.');
                        } else {
                          // If the Future is completed with data
                          return GridView.builder(
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 8.0,
                              mainAxisSpacing: 18.0,
                            ),
                            itemCount: snapshot.data!.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return BookContainer(
                                imageUrl: snapshot.data![index].coverImage,
                                // Pass other required fields from the Book model
                                // You can customize as needed
                              );
                            },
                          );
                        }
                      },
                    ),
                  ),                  /*
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const BookContainer(imageUrl: 'assets/books/1book.jpg',),
                      const BookContainer(imageUrl: 'assets/books/1book.jpg',),
                      // CustomContainer(
                      //   imageUrl: bookImages.elementAt(0),
                      // ),
                      // CustomContainer(
                      //   imageUrl: bookImages.elementAt(1),
                      // ),
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
                  */
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

class Book {
  final int sno;
  final String titleId;
  final String bookTitle;
  final String author;
  final String coverImage;
  final int availableQty;
  final bool lockStatus;

  Book({
    required this.sno,
    required this.titleId,
    required this.bookTitle,
    required this.author,
    required this.coverImage,
    required this.availableQty,
    required this.lockStatus,
  });
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
*/

/// Correct UI code
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:globalcollegeapp/common/widgets/appbar/appbar.dart';
// import 'package:globalcollegeapp/common/widgets/custom_shapes/containers/search_container.dart';
// import 'package:globalcollegeapp/utils/constants/sizes.dart';
// import '../../../../../common/widgets/book_contanier/book_contanier.dart';
// import '../../../../../common/widgets/custom_container_button/custom_container_button.dart';
// import '../../../../../common/widgets/texts/top_first_heading.dart';
// import '../../../../../utils/constants/colors.dart';
// import 'e_library/e_library.dart';
// import 'history/book_history.dart';
// import 'issued_books/issued_books.dart';
//
// class LibraryScreen extends StatelessWidget {
//   const LibraryScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: EColors.backgroundColor,
//       appBar: const GAppBar(
//         backgroundColor: Colors.transparent,
//         showBackArrow: true,
//         centerTitle: true,
//         title: Text(
//           'Library',
//           style: TextStyle(
//             color: EColors.textColorPrimary1,
//             fontWeight: FontWeight.bold,
//             fontSize: 28,
//           ),
//         ),
//       ),
//       body: Column(
//         children: [
//           /// Search bar
//           const ESearchContainer(
//             text: 'Search Books',
//           ),
//           // CustomSearchContainer(
//           //             showBackground: true,
//           //             dark: false,
//           //             showBorder: true,
//           //           ),
//
//           const SizedBox(
//             height: ESizes.spaceBtwItems,
//           ),
//
//           /// Three Buttons eLibrary | Issued Book | History
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 CustomContainerButton(
//                   buttonText: 'eLibrary',
//                   onTap: () {
//                     Get.to(() => const ELibraryScreen(),curve: Curves.easeInOut, transition: Transition.cupertino);
//                   },
//                 ),
//                 CustomContainerButton(
//                   buttonText: 'Issued Books',
//                   onTap: () {
//                     Get.to(() => const IssuedBooksScreen(),curve: Curves.easeInOut, transition: Transition.cupertino);
//                   },
//                 ),
//                 CustomContainerButton(
//                   buttonText: 'History',
//                   onTap: () {
//                     Get.to(() => const BookHistoryScreen(),curve: Curves.easeInOut, transition: Transition.cupertino);
//                   },
//                 ),
//               ],
//             ),
//           ),
//
//           const Padding(
//             padding: EdgeInsets.symmetric(horizontal: 20),
//             child: Divider(),
//           ),
//           const SizedBox(
//             height: ESizes.spaceBtwItems1,
//           ),
//
//           Expanded(
//             child: SingleChildScrollView(
//               physics: const BouncingScrollPhysics(),
//               child: Column(
//                 children: [
//                   /// Title Heading for Books
//                   const Row(
//                     children: [
//                       Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 22),
//                           child: TopHeading(
//                             text:
//                                 'Unveiling Our Newest\nArrivals: Dive into\nFresh Reads',
//                           )),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: ESizes.spaceBtwItems,
//                   ),
//
//                   /// Showcase Library Books
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       CustomContainer(
//                         imageUrl: bookImages.first,
//                       ),
//                       CustomContainer(
//                         imageUrl: bookImages.elementAt(1),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: ESizes.spaceBtwItems,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       CustomContainer(
//                         imageUrl: bookImages.elementAt(2),
//                       ),
//                       CustomContainer(
//                         imageUrl: bookImages.elementAt(3),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: ESizes.spaceBtwItems,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// // Sample list of image URLs (replace these with your actual image URLs)
// final List<String> bookImages = [
//   'assets/books/1book.jpg',
//   'assets/books/2book.jpg',
//   'assets/books/3book.jpg',
//   'assets/books/4book.jpg',
//   'assets/books/1book.jpg',
//   'assets/books/2book.jpg',
//   'assets/books/3book.jpg',
//   'assets/books/4book.jpg',
//   // Add more image URLs as needed
// ];
