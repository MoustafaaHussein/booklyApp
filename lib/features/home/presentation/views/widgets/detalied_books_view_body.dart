import 'package:bookly_app/features/home/domain/entities/books_entity.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/books_action_section.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/books_details_section.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/suggested_books.dart';
import 'package:flutter/material.dart';

class DetaliedBooksViewBody extends StatelessWidget {
  final BooksEntity books;
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
              BooksActionSection(books: books), // TODO
              const Expanded(child: SizedBox(height: 15)),
              const SuggestedBooks(),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ],
    );
  }
}
