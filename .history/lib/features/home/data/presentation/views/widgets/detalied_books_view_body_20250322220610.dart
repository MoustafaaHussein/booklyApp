import 'package:bookly_app/features/home/data/presentation/views/widgets/book_cover.dart';
import 'package:bookly_app/features/home/data/presentation/views/widgets/book_details.dart';
import 'package:bookly_app/features/home/data/presentation/views/widgets/books_list_body.dart';
import 'package:bookly_app/features/home/data/presentation/views/widgets/custom_book_button.dart';
import 'package:bookly_app/features/home/data/presentation/views/widgets/suggested_books.dart';
import 'package:flutter/material.dart';

class DetaliedBooksViewBody extends StatelessWidget {
  const DetaliedBooksViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BookDetailsSection(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16),
                child: Row(
                  children: [
                    CustomBookButton(
                      textColor: Colors.black,
                      displayText: r'19.99$',
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        topLeft: Radius.circular(12),
                      ),
                    ),
                    CustomBookButton(
                      backgroundColor: Color(0xffEF8262),
                      displayText: r'Free preview',
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(child: SizedBox(height: 50)),
              SuggestedBooks(),
              SizedBox(height: 40),
            ],
          ),
        ),
      ],
    );
  }
}

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(right: width * 0.15, left: width * 0.25),
          child: const BookCover(),
        ),
        const Center(child: BookDetails()),
        const Center(child: BooksRating()),
      ],
    );
  }
}
