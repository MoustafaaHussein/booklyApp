// ignore_for_file: file_names

import 'package:bookly_app/features/search/data/presentation/models/search_category_model.dart';
import 'package:bookly_app/features/search/data/presentation/views/widgets/search_subject_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manger/serch specific category cubit/serch_specific_category_cubit.dart';

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
              BlocProvider.of<SerchSpecificCategoryCubit>(
                context,
              ).fetchSpecificCategory(
                searchBy: subjectList[index].subject,
                searchParamter: '',
              );
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
