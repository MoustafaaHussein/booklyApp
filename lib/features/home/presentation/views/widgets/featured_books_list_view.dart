import 'package:bookly_app/core/utils/app_routes.dart';
import 'package:bookly_app/features/home/domain/entities/books_entity.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_cover.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({
    super.key,
    required ScrollController scrollController,
    required this.books,
  }) : _scrollController = scrollController;

  final ScrollController _scrollController;
  final List<BooksEntity> books;
  @override
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: books.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 8, bottom: 8),
            child: GestureDetector(
              onTap: () {
                GoRouter.of(
                  context,
                ).push(AppRouters.kDetailedBookView, extra: books[index]);
              },
              child: BookCover(imageURl: books[index].image),
            ),
          );
        },
      ),
    );
  }
}
