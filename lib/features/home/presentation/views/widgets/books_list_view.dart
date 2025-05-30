import 'package:bookly_app/features/home/presentation/manger/newest_books_cubit/newest_books_cubit_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/books_list_body.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/customized_error_message.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/customized_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksListView extends StatelessWidget {
  const NewestBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return ListView.builder(
            /* physics: const NeverScrollableScrollPhysics(), */
            padding: EdgeInsets.zero,
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return BooksListBody(items: state.books[index]);
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
