import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../../../common/widgets/book_contanier/book_contanier.dart';
import '../../../../../../../utils/constants/sizes.dart';


class BookDetailsWidget extends StatelessWidget {
  final Map<String, dynamic> bookData;

  const BookDetailsWidget({Key? key, required this.bookData}) : super(key: key);

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
                    height: 200,
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
                    const SizedBox(height: ESizes.spaceBtwItems,),
                    BookDescriptionWidget(description: bookData['description']),
                    const SizedBox(height: ESizes.spaceBtwItems,),
                    AuthorLabelWidget(),
                    const SizedBox(height: 4),
                    AuthorNameWidget(author: bookData['author']),
                    const SizedBox(height: ESizes.spaceBtwItems,),
                    AvailableQuantityWidget(availableQty: bookData['availableQty']),
                    const SizedBox(height: ESizes.spaceBtwItems,),
                    DownloadPDFButtonWidget(),
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

class BookTitleWidget extends StatelessWidget {
  final String title;

  const BookTitleWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

class BookDescriptionWidget extends StatelessWidget {
  final String description;

  const BookDescriptionWidget({Key? key, required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Description :',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: Text(
                description,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ],
    );
  }
}


class AuthorLabelWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Author :',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontFamily: 'Inter',
          ),
        ),
      ],
    );
  }
}

class AuthorNameWidget extends StatelessWidget {
  final String author;

  const AuthorNameWidget({Key? key, required this.author}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            author,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class AvailableQuantityWidget extends StatelessWidget {
  final int availableQty;

  const AvailableQuantityWidget({Key? key, required this.availableQty}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Available Qty :',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          availableQty.toString(),
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

class DownloadPDFButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Download: Read Anytime',
          style: TextStyle(
            color: Colors.black,
            fontSize: 8,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(width: 10),
        IconButton(
          onPressed: () {},
          icon: Icon(Iconsax.document_download),
        ),
      ],
    );
  }
}
