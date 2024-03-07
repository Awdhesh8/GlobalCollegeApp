import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:globalcollegeapp/utils/constants/colors.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shimmer/shimmer.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../../../common/widgets/book_contanier/book_contanier.dart';
import '../../../../../../../utils/constants/sizes.dart';

class BookTitleWidget extends StatelessWidget {
  final String title;

  const BookTitleWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: EColors.textColorPrimary1
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class BookDescriptionWidget extends StatelessWidget {
  final String description;

  const BookDescriptionWidget({Key? key, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
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
                style: const TextStyle(
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
  const AuthorLabelWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Text(
          'By :',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 11,
            color: Colors.black38,
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
            'By: $author',
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 11,
              color: Colors.black38,
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

  const AvailableQuantityWidget({Key? key, required this.availableQty})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
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
          style: const TextStyle(
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

class IssueDate extends StatelessWidget {
  final String issueDate;


  const IssueDate({Key? key, required this.issueDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'Issue:',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            issueDate,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 12,
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

class IssueTime extends StatelessWidget {
  final String issueTime;


  const IssueTime({Key? key, required this.issueTime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'Issue:',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          issueTime,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 12,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

class ReturnDate extends StatelessWidget {
  final String returnDate;


  const ReturnDate({Key? key, required this.returnDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'Return:',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            returnDate,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 12,
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

class ReturnTime extends StatelessWidget {
  final String returnTime;


  const ReturnTime({Key? key, required this.returnTime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'Return:',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          returnTime,
          style: const TextStyle(
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
  final String downloadLink;

  DownloadPDFButtonWidget({required this.downloadLink});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Text(
          'Download: Read Anytime',
          style: TextStyle(
            color: Colors.black,
            fontSize: 8,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ),
        // const SizedBox(width: 10),
        IconButton(
          onPressed: () async {
            // Open the link in the default web browser
            await launch(downloadLink);
          },
          icon: const Icon(Iconsax.document_download),
        ),
      ],
    );
  }
}
/*


class DownloadPDFButtonWidget extends StatelessWidget {
  final String downloadLink;

  DownloadPDFButtonWidget({required this.downloadLink});

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: Container(
              // width: 250,
              height: 60,
              child: SlideAction(
                innerColor: EColors.backgroundColor2,
                outerColor: EColors.white,
                elevation: 0,
                height: 40,
                sliderButtonIconSize: 18,
                borderRadius: 8,
                // text: 'Download',
                child: Shimmer.fromColors(
                  baseColor: EColors.textColorPrimary1,
                  highlightColor: EColors.lightContainer1,
                  child: Text(
                    'Download Now',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: EColors.textColorPrimary1
                  ),
                  ),
                ),
                // alignment: Alignment.centerRight,
                sliderButtonIconPadding: 8,
                animationDuration: const Duration(milliseconds: 300),
                // sliderButtonIcon: Icon(Iconsax.document_download),
                sliderButtonYOffset: -4,
                onSubmit: () async {
                  // Open the link in the default web browser
                  await launch(downloadLink);
                },
              ),
              ),
        ),

        /*
        const Text(
          'Download: Read Anytime',
          style: TextStyle(
            color: Colors.black,
            fontSize: 8,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ),
        // const SizedBox(width: 10),
        IconButton(
          onPressed: () async {
            // Open the link in the default web browser
            await launch(downloadLink);
          },
          icon: const Icon(Iconsax.document_download),
        ),

         */

      ],
    );
  }
}

 */
