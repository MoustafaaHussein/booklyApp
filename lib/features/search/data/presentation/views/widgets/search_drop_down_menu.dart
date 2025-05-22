import 'package:bookly_app/features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/manger/newest_books_cubit/newest_books_cubit_cubit.dart';
import 'package:bookly_app/features/search/data/presentation/models/search_category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchSubjectDropDownMenu extends StatefulWidget {
  const SearchSubjectDropDownMenu({super.key});

  @override
  SearchSubjectDropDownMenuState createState() =>
      SearchSubjectDropDownMenuState();
}

class SearchSubjectDropDownMenuState extends State<SearchSubjectDropDownMenu> {
  SearchCategoryModel? selectedSubject = subjectList.first; // Default selection

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButton<SearchCategoryModel>(
        value: selectedSubject,
        onChanged: (SearchCategoryModel? newValue) {
          setState(() {
            selectedSubject = newValue;
            BlocProvider.of<FeaturedBooksCubit>(
              context,
            ).fetchFeaturedBooks(category: newValue!.subject);
            BlocProvider.of<NewestBooksCubit>(
              context,
            ).fetchNewestBooks(category: newValue.subject);
          });
        },
        items:
            subjectList.map<DropdownMenuItem<SearchCategoryModel>>((
              SearchCategoryModel subject,
            ) {
              return DropdownMenuItem<SearchCategoryModel>(
                value: subject,
                child: Text(subject.subject),
              );
            }).toList(),
      ),
    );
  }
}
