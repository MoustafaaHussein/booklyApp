import 'package:bookly_app/features/home/data/presentation/views/widgets/books_list_header.dart';
import 'package:bookly_app/features/home/data/presentation/views/widgets/books_list_view.dart';
import 'package:bookly_app/features/home/data/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly_app/features/home/data/presentation/views/widgets/featured_book_list_view.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
      child: CustomScrollView(
        physics: NeverScrollableScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomAppBar(),
                    FuturedBookListView(),
                    SizedBox(height: 20),
                    BookListHeader(),
                  ],
                ),
              ],
            ),
          ),
          SliverFillRemaining(
            child: Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: NewestBooksListView(),
            ),
          ),
        ],
      ),
    );
  }
}
