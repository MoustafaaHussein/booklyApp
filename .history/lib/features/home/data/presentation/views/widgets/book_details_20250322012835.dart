import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class BookDetails extends StatelessWidget {
  const BookDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'The Jungle Book',
          style: AppStyles.styleRegular30(
            context,
          ).copyWith(fontFamily: kGTSectraFine),
        ),
        Text(
          'Rudyard Kipling',
          style: AppStyles.styleMedium18(
            context,
          ).copyWith(color: const Color(0xff707070)),
        ),
      ],
    );
  }
}
