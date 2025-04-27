import 'package:bookly_app/features/search/data/presentation/models/search_category_model.dart';
import 'package:bookly_app/features/search/data/presentation/views/widgets/search_subject_item.dart';
import 'package:flutter/material.dart';

class SearchSubjectListView extends StatelessWidget {
  final List<SearchCategoryModel> model;

  const SearchSubjectListView({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: subjects!.length,
      itemBuilder: (context, index) {
        return SearchSubjectItem(subject: subjects![index].toString());
      },
    );
  }
}
