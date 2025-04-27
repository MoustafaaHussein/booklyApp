import 'package:bookly_app/core/utils/app_styles.dart';
import 'package:bookly_app/features/search/data/presentation/models/search_category_model.dart';
import 'package:flutter/material.dart';

class SearchSubjectItem extends StatelessWidget {
  const SearchSubjectItem({super.key, required this.model});
  final SearchCategoryModel model;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5 / 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            animationDuration: const Duration(seconds: 1),
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 5, // Shadow effect
          ),
          onPressed: () {},
          child: Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                model.subject,
                style: AppStyles.styleSemiBold18(
                  context,
                ).copyWith(color: Colors.black54),
                selectionColor: Colors.yellow,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
