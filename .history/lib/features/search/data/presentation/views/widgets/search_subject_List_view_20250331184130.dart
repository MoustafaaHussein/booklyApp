import 'package:bookly_app/features/search/data/presentation/models/search_category_model.dart';
import 'package:bookly_app/features/search/data/presentation/views/widgets/search_subject_item.dart';
import 'package:flutter/material.dart';

class SearchSubjectListView extends StatelessWidget {
  SearchCategoryModel? model;

  SearchSubjectListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: subjectList.length,
      itemBuilder: (context, index) {
        return SearchSubjectItem(model: model!);
      },
    );
  }
}
