import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:globalcollegeapp/utils/constants/colors.dart';

class BookContainer extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String author;
  final String availableQty;
  final String lockStatus;

  const BookContainer({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.author,
    required this.availableQty,
    required this.lockStatus,
  }) : super(key: key);

  @override
  State<BookContainer> createState() => _BookContainerState();
}

class _BookContainerState extends State<BookContainer> {
  String lockStatus = ''; // Track the book lock state

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      front: BookFront(imageUrl: widget.imageUrl),
      back: BookBack(
        lockStatus: widget.lockStatus,
        onToggle: () {
          // Show AlertDialog for locking or unlocking
          showDialog(
            context: context,
            builder: (context) {
              return lockStatus == "True"
                  ? UnlockBookDialog(onUnlock: unlockBook)
                  : LockBookDialog(onLock: lockBook);
            },
          );
        },
        title: widget.title,
        author: widget.author,
        availableQty: widget.availableQty,
      ),
    );
  }

  void lockBook() {
    // Show SnackBar for book locking
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Book Locking process successful'),
      ),
    );
    // Update the book lock state
    setState(() {
      lockStatus = "True";
    });
  }

  void unlockBook() {
    // Show SnackBar for book unlocking
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Book Unlocking process successful'),
      ),
    );
    // Update the book lock state
    setState(() {
      lockStatus = "False";
    });
  }
}

class BookFront extends StatelessWidget {
  final String imageUrl;

  const BookFront({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = 165.0;
    var height = 264.69;
    return Container(
      // width: width,
      // height: height,
      decoration: ShapeDecoration(
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.fill,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Transform.rotate(
            angle: 31,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  const BoxShadow(
                    color: Colors.black26,
                    blurRadius: .5,
                    spreadRadius: .5,
                  ),
                ],
              ),
              child: const Padding(
                padding: EdgeInsets.all(6.0),
                child: Text(
                  'Tap Here!!!',
                  style: TextStyle(
                    color: EColors.textColorPrimary1,
                    fontFamily: 'Inter',
                    fontSize: 10,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BookBack extends StatelessWidget {
  final VoidCallback onToggle;
  final String title;
  final String author;
  final String availableQty;
  final String lockStatus;

  const BookBack(
      {Key? key,
      required this.onToggle,
      required this.title,
      required this.author,
      required this.availableQty,
        required this.lockStatus
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var width = 165.0;
    // var height = 264.69;
    final MaterialStateProperty<Icon?> thumbIcon =
        MaterialStateProperty.resolveWith<Icon?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return const Icon(Icons.check);
        }
        return const Icon(Icons.close);
      },
    );

    return Container(
      // width: width,
      // height: height,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Book Title
            Text(
              title,
              // 'THE FIRST THREE MINUTES',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: EColors.textColorPrimary1,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            const SizedBox(
              height: 10,
            ),

            /// Description
            const Text(
              'Description:',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 10,
                color: EColors.primarySecond,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),

            /// Book Description here
            const Text(
              'The Book Details Here you can check the details here!!!',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 10,
                color: EColors.textColorPrimary1,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 10,
            ),

            ///Author
            const Text(
              'Author:',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 10,
                color: EColors.primarySecond,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),

            /// Author Name here
            Text(
              author,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 10,
                color: EColors.textColorPrimary1,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 10,
            ),

            ///Quantity
            Row(
              children: [
                Text(
                  'Quantity:',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 10,
                    color: EColors.primarySecond,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  availableQty,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 10,
                    color: EColors.textColorPrimary1,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),

            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Lock Book:',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 10,
                    color: EColors.primarySecond,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Transform.scale(
                  scale: 0.8,
                  child: Switch(
                    thumbIcon: thumbIcon,
                    activeColor: EColors.primarySecond,
                    value: lockStatus == "True",
                    // value: lockStatus,
                    onChanged: (value) {
                      onToggle();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LockBookDialog extends StatelessWidget {
  final VoidCallback onLock;

  const LockBookDialog({Key? key, required this.onLock}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Lock Book'),
      content: const Text('Do you want to lock the book?'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('No'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            onLock();
          },
          child: const Text('Yes'),
        ),
      ],
    );
  }
}

class UnlockBookDialog extends StatelessWidget {
  final VoidCallback onUnlock;

  const UnlockBookDialog({Key? key, required this.onUnlock}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Unlock Book'),
      content: const Text('Do you want to unlock the book?'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('No'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            onUnlock();
          },
          child: const Text('Yes'),
        ),
      ],
    );
  }
}
