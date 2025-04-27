import 'package:bookly_app/core/utils/app_styles.dart';
import 'package:bookly_app/features/home/data/presentation/views/widgets/book_cover.dart';
import 'package:bookly_app/features/home/data/presentation/views/widgets/book_details.dart';
import 'package:bookly_app/features/home/data/presentation/views/widgets/books_list_body.dart';
import 'package:bookly_app/features/home/data/presentation/views/widgets/custom_book_button.dart';
import 'package:flutter/material.dart';

class DetaliedBooksViewBody extends StatelessWidget {
  const DetaliedBooksViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  right: width * 0.15,
                  left: width * 0.25,
                ),
                child: const BookCover(),
              ),

              const Center(child: BookDetails()),
              const Center(child: BooksRating()),
              const Padding(
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

              const SuggestedBooks(),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ],
    );
  }
}

class SuggestedBooks extends StatelessWidget {
  const SuggestedBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("You May Also Like ", style: AppStyles.styleSemiBold18(context)),
        const SuggestedBooksListView(),
      ],
    );
  }
}

class SuggestedBooksListView extends StatelessWidget {
  const SuggestedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.only(top: 8, left: 8, bottom: 8),
            child: BookCover(),
          );
        },
      ),
    );
  }
}
