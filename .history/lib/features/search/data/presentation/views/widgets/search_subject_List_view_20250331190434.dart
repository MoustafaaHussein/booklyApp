import 'package:bookly_app/features/search/data/presentation/models/search_category_model.dart';
import 'package:bookly_app/features/search/data/presentation/views/widgets/search_subject_item.dart';
import 'package:flutter/material.dart';

class SearchSubjectListView extends StatelessWidget {
  const SearchSubjectListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: subjectList.length,
            itemBuilder: (context, index) {
              return SearchSubjectItem(model: subjectList[index]);
            },
          ),
        ),
      ),
    );
  }
}
