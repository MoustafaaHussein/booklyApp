import 'package:bookly_app/core/utils/app_routes.dart';
import 'package:bookly_app/features/home/presentation/manger/similar%20books%20cubit/similar_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_cover.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/customized_error_message.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/customized_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SuggestedBooksListView extends StatelessWidget {
  const SuggestedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
            child: ListView.builder(
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 8, left: 8, bottom: 8),
                  child: GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(
                        AppRouters.kDetailedBookView,
                        extra: state.books[index],
                      );
                    },
                    child: BookCover(
                      imageURl:
                          state.books[index].volumeInfo.imageLinks.thumbnail,
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is SimilarBooksFailure) {
          return CustomizedErrorMessage(errorMessage: state.errorMessage);
        } else {
          return const CustomizedLoadingIndicator();
        }
      },
    );
  }
}
