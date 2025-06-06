import 'package:bookly_app/features/home/presentation/manger/newest_books_cubit/newest_books_cubit_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/books_list_body.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/customized_error_message.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/customized_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksListView extends StatefulWidget {
  const NewestBooksListView({super.key, required this.category});
  final String category;

  @override
  State<NewestBooksListView> createState() => _NewestBooksListViewState();
}

class _NewestBooksListViewState extends State<NewestBooksListView> {
  final ScrollController _scrollController = ScrollController();
  var nextPage = 1;
  bool _hasFetchedMore = false;
  @override
  void initState() {
    super.initState();
    context.read<NewestBooksCubit>().fetchNewestBooks(
      category: widget.category,
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
      context.read<NewestBooksCubit>().fetchNewestBooks(
        category: widget.category,
        forceRefresh: true,
        pageNumber: nextPage++,
      );

      // Optional: reset flag after delay if pagination is supported
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return BooksListBody(books: state.books[index]);
            },
          );
        } else if (state is NewestBooksFailure) {
          return CustomizedErrorMessage(errorMessage: state.errorMessage);
        } else {
          return const CustomizedLoadingIndicator();
        }
      },
    );
  }
}
