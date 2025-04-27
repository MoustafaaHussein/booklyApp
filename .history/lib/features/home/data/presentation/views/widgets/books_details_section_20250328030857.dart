import 'package:bookly_app/features/home/data/models/books_model/books_model.dart';
import 'package:bookly_app/features/home/data/presentation/views/widgets/book_cover.dart';
import 'package:bookly_app/features/home/data/presentation/views/widgets/book_details.dart';
import 'package:bookly_app/features/home/data/presentation/views/widgets/books_list_body.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.books});
  final BooksModel books;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(right: width * 0.15, left: width * 0.15),
          child: BookCover(imageURl: books.volumeInfo.imageLinks.thumbnail),
        ),
        Center(
          child: BookDetails(
            title: books.volumeInfo.title,
            author: books.volumeInfo.authors.toString(),
          ),
        ),
        const Center(child: BooksRating()),
      ],
    );
  }
}
