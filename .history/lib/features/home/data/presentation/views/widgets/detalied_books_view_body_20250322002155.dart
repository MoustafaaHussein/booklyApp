import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/app_images.dart';
import 'package:bookly_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class DetaliedBooksViewBody extends StatelessWidget {
  const DetaliedBooksViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SelectedBookCover(),
        const SizedBox(height: 40),
        Text(
          'The Jungle Book',
          style: AppStyles.styleRegular30(
            context,
          ).copyWith(fontFamily: kGTSectraFine),
        ),
      ],
    );
  }
}

class SelectedBookCover extends StatelessWidget {
  const SelectedBookCover({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.7 / 4,
      child: Container(
        decoration: ShapeDecoration(
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
