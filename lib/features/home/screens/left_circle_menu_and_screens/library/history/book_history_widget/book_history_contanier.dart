import 'package:flutter/material.dart';

import '../../../../../../../common/widgets/book_contanier/book_contanier.dart';
import '../../../../../../../utils/constants/sizes.dart';
import '../../e_library/book_widget/e_book_widget.dart';


class BookHistoryContainer extends StatelessWidget {
  final Map<String, dynamic> bookData;

  const BookHistoryContainer({Key? key, required this.bookData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x26000000),
              blurRadius: 10.40,
              offset: Offset(0, 4),
              spreadRadius: 0,
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Column(
                children: [
                  CustomContainer(
                    imageUrl: bookData['imageUrl'] ?? 'assets/books/1book.jpg',
                    height: 250,
                    width: 132,
                  ),
                ],
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BookTitleWidget(title: bookData['title']),
                    const SizedBox(
                      height: ESizes.spaceBtwItems,
                    ),
                    BookDescriptionWidget(description: bookData['description']),
                    const SizedBox(
                      height: ESizes.spaceBtwItems,
                    ),
                    AuthorLabelWidget(),
                    const SizedBox(height: 4),
                    AuthorNameWidget(author: bookData['author']),
                    const SizedBox(
                      height: ESizes.spaceBtwItems,
                    ),
                    AvailableQuantityWidget(
                        availableQty: bookData['availableQty']),
                    const SizedBox(
                      height: ESizes.spaceBtwItems,
                    ),
                    IssueDate(issueDate: bookData['issueDate'],
                    ),
                    const SizedBox(
                      height: ESizes.spaceBtwItems,
                    ),
                    IssueTime(issueTime: bookData['issueTime'],
                    ),
                    const SizedBox(
                      height: ESizes.spaceBtwItems,
                    ),
                    ReturnDate(returnDate: bookData['returnDate'],
                    ),
                    const SizedBox(
                      height: ESizes.spaceBtwItems,
                    ),
                    ReturnTime(returnTime: bookData['returnTime'],
                    ),
                    const SizedBox(
                      height: ESizes.spaceBtwItems,
                    ),


                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
