import 'package:bookly_app/features/home/data/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/features/home/data/presentation/views/widgets/book_cover.dart';
import 'package:bookly_app/features/home/data/presentation/views/widgets/customized_error_message.dart';
import 'package:bookly_app/features/home/data/presentation/views/widgets/customized_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FuturedBookListView extends StatelessWidget {
  const FuturedBookListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: ListView.builder(
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 8, bottom: 8),
                  child: BookCover(
                    imageURl:
                        state.books[index].volumeInfo.imageLinks.thumbnail,
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
