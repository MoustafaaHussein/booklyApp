import 'package:bookly_app/core/models/books_model/books_model.dart';
import 'package:bookly_app/features/search/data/presentation/views/widgets/search_view_body.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key, required this.books});
  final BooksModel books;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SearchViewBody(books: books));
  }
}
