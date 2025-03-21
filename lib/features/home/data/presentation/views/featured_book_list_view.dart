import 'package:bookly_app/features/home/data/presentation/views/widgets/book_cover.dart';
import 'package:flutter/material.dart';

class FuturedBookListView extends StatelessWidget {
  const FuturedBookListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.only(left: 8.0, top: 8, bottom: 8),
            child: BookCover(),
          );
        },
      ),
    );
  }
}
