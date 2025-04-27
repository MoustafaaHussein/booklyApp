import 'package:bookly_app/core/models/books_model/books_model.dart';
import 'package:bookly_app/features/home/data/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/features/home/data/presentation/manger/newest_books_cubit/newest_books_cubit_cubit.dart';
import 'package:bookly_app/features/home/data/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key, required this.books, this.category});
  final BooksModel books;
  String? category;
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    if (widget.category == null) {
      widget.category = 'politics';
      BlocProvider.of<FeaturedBooksCubit>(
        context,
      ).fetchFeaturedBooks(category: widget.category!);
      BlocProvider.of<NewestBooksCubit>(
        context,
      ).fetchNewestBooks(category: widget.category!);
    } else {
      BlocProvider.of<FeaturedBooksCubit>(
        context,
      ).fetchFeaturedBooks(category: widget.category!);
      BlocProvider.of<NewestBooksCubit>(
        context,
      ).fetchNewestBooks(category: widget.category!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: HomeViewBody());
  }
}
