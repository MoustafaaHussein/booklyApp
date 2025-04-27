import 'package:bookly_app/features/home/data/models/books_model/books_model.dart';
import 'package:bookly_app/features/home/data/presentation/manger/similar%20books%20cubit/similar_books_cubit.dart';
import 'package:bookly_app/features/home/data/presentation/views/widgets/custom_detalied_books_app_bar.dart';
import 'package:bookly_app/features/home/data/presentation/views/widgets/detalied_books_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetaliedBooksView extends StatefulWidget {
  const DetaliedBooksView({super.key, required this.book});
  final BooksModel book;
  @override
  State<DetaliedBooksView> createState() => _DetaliedBooksViewState();
}

class _DetaliedBooksViewState extends State<DetaliedBooksView> {
  @override
  void initState() {
    BlocProvider.of<SimilarBooksCubit>(
      context,
    ).fetchSimilarBooks(category: widget.book.volumeInfo.categories![0]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomDetaliedBooksAppBar(),
      body: DetaliedBooksView(book: book),
    );
  }
}
