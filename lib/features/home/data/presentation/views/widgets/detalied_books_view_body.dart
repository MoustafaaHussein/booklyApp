import 'package:bookly_app/features/home/data/presentation/views/widgets/books_action_section.dart';
import 'package:bookly_app/features/home/data/presentation/views/widgets/books_details_section.dart';
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
              BooksActionSection(),
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
