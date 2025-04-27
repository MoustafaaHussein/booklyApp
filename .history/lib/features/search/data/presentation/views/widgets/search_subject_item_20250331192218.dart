import 'package:bookly_app/core/utils/app_styles.dart';
import 'package:bookly_app/features/search/data/presentation/models/search_category_model.dart';
import 'package:flutter/material.dart';

class SearchSubjectItem extends StatelessWidget {
  const SearchSubjectItem({super.key, required this.model});
  final SearchCategoryModel model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Container(
        height: 40,
        width: 200,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            animationDuration: const Duration(seconds: 1),

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            // Shadow effect
          ),
          onPressed: () {},
          child: FittedBox(
            child: Text(
              model.subject,
              style: AppStyles.styleSemiBold16(
                context,
              ).copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
