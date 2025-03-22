import 'package:bookly_app/core/utils/app_images.dart';
import 'package:flutter/material.dart';

class BookCover extends StatelessWidget {
  const BookCover({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.7 / 4,
      child: Container(
        decoration: ShapeDecoration(
          color: Colors.white,
          image: const DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(Assets.imagesTestImage),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}
