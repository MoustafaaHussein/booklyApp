import 'package:bookly_app/features/home/data/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/features/home/data/presentation/manger/newest_books_cubit/newest_books_cubit_cubit.dart';
import 'package:bookly_app/features/home/data/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() async {
    BlocProvider.of<FeaturedBooksCubit>(
      context,
    ).fetchFeaturedBooks(category: 'politics');
    BlocProvider.of<NewestBooksCubit>(
      context,
    ).fetchNewestBooks(category: 'politics');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: HomeViewBody());
  }
}
