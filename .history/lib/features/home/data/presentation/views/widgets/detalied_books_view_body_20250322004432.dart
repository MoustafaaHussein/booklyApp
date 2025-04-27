import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/app_styles.dart';
import 'package:bookly_app/features/home/data/presentation/views/widgets/book_cover.dart';
import 'package:bookly_app/features/home/data/presentation/views/widgets/books_list_body.dart';
import 'package:flutter/material.dart';

class DetaliedBooksViewBody extends StatelessWidget {
  const DetaliedBooksViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const BookCover(),
        const SizedBox(height: 40),
        const BookDetails(),
        const BooksRating(),
        Row(children: [Container()]),
      ],
    );
  }
}

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
