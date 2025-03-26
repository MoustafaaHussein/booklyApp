import 'package:flutter/material.dart';

class BookCover extends StatelessWidget {
  const BookCover({super.key, required this.imageURl});
  final String imageURl;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.7 / 4,
      child: Container(
        decoration: ShapeDecoration(
          color: Colors.white,
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(imageURl),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}
