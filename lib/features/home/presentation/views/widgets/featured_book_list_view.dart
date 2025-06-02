import 'package:bookly_app/core/utils/app_routes.dart';
import 'package:bookly_app/features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_cover.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/customized_error_message.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/customized_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FuturedBookListView extends StatefulWidget {
  const FuturedBookListView({super.key, required this.category});
  final String category;
  @override
  State<FuturedBookListView> createState() => _FuturedBookListViewState();
}

class _FuturedBookListViewState extends State<FuturedBookListView> {
  final ScrollController _scrollController = ScrollController();
  var nextPage = 1;
  bool _hasFetchedMore = false;

  @override
  void initState() {
    super.initState();
    context.read<FeaturedBooksCubit>().fetchFeaturedBooks(
      category: widget.category,
    );
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;

    if (!_hasFetchedMore && currentScroll >= 0.7 * maxScroll) {
      _hasFetchedMore = true;
      context.read<FeaturedBooksCubit>().fetchFeaturedBooks(
        category: widget.category,

        pageNumber: nextPage++,
      );

      // Optional: reset flag after delay if pagination is supported
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: ListView.builder(
              controller: _scrollController,
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 8, bottom: 8),
                  child: GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(
                        AppRouters.kDetailedBookView,
                        extra: state.books[index],
                      );
                    },
                    child: BookCover(imageURl: state.books[index].image),
                  ),
                );
              },
            ),
          );
        } else if (state is FeaturedBooksFailure) {
          return CustomizedErrorMessage(errorMessage: state.errorMessage);
        } else {
          return const CustomizedLoadingIndicator();
        }
      },
    );
  }
}
