import 'package:bookly_app/core/utils/app_styles.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/search_subject_List_view.dart';
import 'package:flutter/material.dart';

class CategoryFilter extends StatelessWidget {
  const CategoryFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text('Category', style: AppStyles.styleRegular20(context)),
          ),
          const SearchSubjectListView(),
          const Expanded(child: SizedBox()),
        ],
      ),
    );
  }
}
