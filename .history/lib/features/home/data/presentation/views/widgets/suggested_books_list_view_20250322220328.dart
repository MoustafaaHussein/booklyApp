import 'package:bookly_app/features/home/data/presentation/views/widgets/book_cover.dart';
import 'package:flutter/material.dart';

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
