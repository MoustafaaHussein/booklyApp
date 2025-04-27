import 'package:bookly_app/features/home/data/models/books_model/books_model.dart';
import 'package:bookly_app/features/home/data/presentation/manger/similar%20books%20cubit/similar_books_cubit.dart';
import 'package:bookly_app/features/home/data/presentation/views/widgets/books_action_section.dart';
import 'package:bookly_app/features/home/data/presentation/views/widgets/books_details_section.dart';
import 'package:bookly_app/features/home/data/presentation/views/widgets/suggested_books.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetaliedBooksViewBody extends StatefulWidget {
  final BooksModel books;
  const DetaliedBooksViewBody({super.key, required this.books});

  @override
  State<DetaliedBooksViewBody> createState() => _DetaliedBooksViewBodyState();
}

class _DetaliedBooksViewBodyState extends State<DetaliedBooksViewBody> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
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
      },
    );
  }
}
