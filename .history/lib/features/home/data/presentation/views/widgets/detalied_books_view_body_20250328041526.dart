import 'package:bookly_app/features/home/data/models/books_model/books_model.dart';
import 'package:bookly_app/features/home/data/presentation/views/widgets/books_action_section.dart';
import 'package:bookly_app/features/home/data/presentation/views/widgets/books_details_section.dart';
import 'package:bookly_app/features/home/data/presentation/views/widgets/suggested_books.dart';
import 'package:flutter/material.dart';

class DetaliedBooksViewBody extends StatelessWidget {
  final BooksModel books;
  const DetaliedBooksViewBody({super.key, required this.books});
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BookDetailsSection(books: books),
              const BooksActionSection(),
              const Expanded(child: SizedBox(height: 25)),
              const SuggestedBooks(),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ],
    );
  }
}
