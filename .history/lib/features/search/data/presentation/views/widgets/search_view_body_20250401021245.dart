import 'package:bookly_app/core/utils/app_routes.dart';
import 'package:bookly_app/features/home/data/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/features/home/data/presentation/manger/newest_books_cubit/newest_books_cubit_cubit.dart';
import 'package:bookly_app/features/home/data/presentation/views/widgets/customized_error_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../manger/serch specific category cubit/serch_specific_category_cubit.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SerchSpecificCategoryCubit, SerchSpecificCategoryState>(
      builder: (context, state) {
        if (state is SerchSpecificCategoryInitial) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /*  Padding(
                padding: const EdgeInsets.all(20),
                child: IconButton(
                  onPressed: () {
                    GoRouter.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                ),
              ), */
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  onSubmitted: (value) {
                    fetchBooks(context, value);
                  },
                  decoration: InputDecoration(
                    hintText: 'Serch for Specific Category',
                    suffixIcon: const Icon(FontAwesomeIcons.magnifyingGlass),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          );
        } else if (state is SerchSpecificCategoryFailure) {
          return CustomizedErrorMessage(errorMessage: state.errorMessage);
        } else {
          return const Text('Hello');
        }
      },
    );
  }

  void fetchBooks(BuildContext context, String value) {
    BlocProvider.of<FeaturedBooksCubit>(
      context,
    ).fetchFeaturedBooks(category: value);
    BlocProvider.of<NewestBooksCubit>(
      context,
    ).fetchNewestBooks(category: value);
    GoRouter.of(context).push(AppRouters.kHomePath, extra: value);
  }

  /* Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back, color: Colors.white),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            onSubmitted: (value) {
              BlocProvider.of<SerchSpecificCategoryCubit>(
                context,
              ).fetchSpecificCategory(category: value);
              BlocProvider.of<FeaturedBooksCubit>(
                context,
              ).fetchFeaturedBooks(category: value);
              BlocProvider.of<NewestBooksCubit>(
                context,
              ).fetchNewestBooks(category: value);
              GoRouter.of(context).push(AppRouters.kHomePath, extra: value);
            },
            decoration: InputDecoration(
              hintText: 'Serch for Specific Category',
              suffixIcon: const Icon(FontAwesomeIcons.magnifyingGlass),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
        
      ],
    );
 */
  /*     */
}
