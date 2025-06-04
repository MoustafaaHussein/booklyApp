import 'package:bookly_app/core/utils/app_routes.dart';
import 'package:bookly_app/features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/manger/newest_books_cubit/newest_books_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            onSubmitted: (value) {
              fetchBooks(context, value);
            },
            decoration: InputDecoration(
              hintText: 'Search for book title or category',
              suffixIcon: const Icon(FontAwesomeIcons.magnifyingGlass),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void fetchBooks(BuildContext context, String value) {
    if (value.trim().isEmpty) return;
    BlocProvider.of<FeaturedBooksCubit>(
      context,
    ).fetchFeaturedBooks(category: value, forceRefresh: true);
    BlocProvider.of<NewestBooksCubit>(context).fetchNewestBooks(
      category: value,
      forceRefresh: true,
    ); // Avoid empty search
    GoRouter.of(context).push(AppRouters.kHomePath, extra: value);
  }
}
