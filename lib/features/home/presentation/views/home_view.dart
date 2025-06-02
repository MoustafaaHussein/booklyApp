import 'package:bookly_app/features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/manger/newest_books_cubit/newest_books_cubit_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, required this.category});
  final String category;
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<FeaturedBooksCubit>(
      context,
    ).fetchFeaturedBooks(category: widget.category);
    BlocProvider.of<NewestBooksCubit>(
      context,
    ).fetchNewestBooks(category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: HomeViewBody(category: widget.category));
  }
}
