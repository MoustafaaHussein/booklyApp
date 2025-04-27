import 'package:bookly_app/core/utils/app_styles.dart';
import 'package:bookly_app/features/search/data/presentation/models/search_category_model.dart';
import 'package:flutter/material.dart';

class SearchSubjectItem extends StatelessWidget {
  const SearchSubjectItem({super.key, required this.model});
  final SearchCategoryModel model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black),
        ),
        child: Text(
          model.subject,
          style: AppStyles.styleSemiBold18(context),
          selectionColor: Colors.yellow,
        ),
      ),
    );
  }
}
