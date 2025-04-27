import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/app_styles.dart';
import 'package:bookly_app/features/home/data/presentation/views/widgets/book_cover.dart';
import 'package:bookly_app/features/home/data/presentation/views/widgets/books_list_body.dart';
import 'package:flutter/material.dart';

class DetaliedBooksViewBody extends StatelessWidget {
  const DetaliedBooksViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.only(
            right: width * 0.15,
            left: width * 0.15 + 20,
          ),
          child: const BookCover(),
        ),
        const SizedBox(height: 10),
        const BookDetails(),
        const BooksRating(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
          height: 48,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    topLeft: Radius.circular(12),
                  ),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 14,
                      horizontal: 31,
                    ),
                    child: FittedBox(
                      child: Text(
                        r'19.99$',

                        style: AppStyles.styleSemiBold24(
                          context,
                        ).copyWith(color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Color(0xffEF8262),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 14,
                      horizontal: 31,
                    ),
                    child: FittedBox(
                      child: Text(
                        'Free Preview',
                        style: AppStyles.styleSemiBold24(context),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
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
