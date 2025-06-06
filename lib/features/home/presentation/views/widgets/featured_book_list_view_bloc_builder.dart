import 'package:bookly_app/features/home/domain/entities/books_entity.dart';
import 'package:bookly_app/features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/customized_error_message.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/customized_loading_indicator.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/featured_books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FuturedBookListViewBloc extends StatefulWidget {
  const FuturedBookListViewBloc({super.key, required this.category});
  final String category;
  @override
  State<FuturedBookListViewBloc> createState() =>
      _FuturedBookListViewBlocState();
}

class _FuturedBookListViewBlocState extends State<FuturedBookListViewBloc> {
  final ScrollController _scrollController = ScrollController();
  var nextPage = 1;
  bool _hasFetchedMore = false;

  @override
  void initState() {
    super.initState();
    context.read<FeaturedBooksCubit>().fetchFeaturedBooks(
      category: widget.category,
      forceRefresh: true,
    );
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() async {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;

    if (!_hasFetchedMore && currentScroll >= 0.7 * maxScroll) {
      _hasFetchedMore = true;
      await context.read<FeaturedBooksCubit>().fetchFeaturedBooks(
        category: widget.category,
        forceRefresh: true,
        pageNumber: nextPage++,
      );

      // Optional: reset flag after delay if pagination is supported
    }
  }

  List<BooksEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
      listener: (context, state) {
        if (state is FeaturedBooksSuccess) {
          books.addAll(state.books);
        }
      },
      builder: (context, state) {
        if (state is FeaturedBooksSuccess ||
            state is FeaturedBooksPaginationLoading) {
          return FeaturedBooksListView(
            scrollController: _scrollController,
            books: books,
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
