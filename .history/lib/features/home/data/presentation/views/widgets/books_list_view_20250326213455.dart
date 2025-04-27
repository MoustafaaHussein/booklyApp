import 'package:bookly_app/features/home/data/presentation/views/widgets/books_list_body.dart';
import 'package:flutter/material.dart';

class NewestBooksListView extends StatelessWidget {
  const NewestBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 30,
      padding: EdgeInsets.zero,

      itemBuilder: (context, index) {
        return const BooksListBody();
      },
    );
  }
}
