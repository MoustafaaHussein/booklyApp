import 'package:bookly_app/features/home/domain/entities/books_entity.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_cover.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_details.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/books_ratting.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.books});
  final BooksEntity books;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(right: width * 0.15, left: width * 0.15),
          child: BookCover(imageURl: books.image),
        ),
        Center(
          child: BookDetails(
            title: books.title,
            author: books.author.toString(),
          ),
        ),
        const Center(child: BooksRating()),
      ],
    );
  }
}
