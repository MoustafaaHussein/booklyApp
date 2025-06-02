// ignore_for_file: file_names

import 'package:bookly_app/features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/features/search/presentation/models/search_category_model.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/search_subject_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchSubjectListView extends StatelessWidget {
  const SearchSubjectListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.1,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: subjectList.length,
        itemBuilder: (context, index) {
          return ElevatedButton(
            onPressed: () {
              BlocProvider.of<FeaturedBooksCubit>(
                context,
              ).fetchFeaturedBooks(category: subjectList[index].subject);
            },
            style: ElevatedButton.styleFrom(
              animationDuration: const Duration(seconds: 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: SearchSubjectItem(model: subjectList[index]),
          );
        },
      ),
    );
  }
}
