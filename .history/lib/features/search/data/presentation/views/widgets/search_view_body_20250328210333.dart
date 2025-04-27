import 'package:bookly_app/features/search/data/presentation/manger/serch%20specific%20category%20cubit/serch_specific_category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SerchSpecificCategoryCubit, SerchSpecificCategoryState>(
      builder: (context, state) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: TextField(
                onSubmitted: (value) {
                  BlocProvider.of<SerchSpecificCategoryCubit>(
                    context,
                  ).fetchSpecificCategory(category: value);
                },
                decoration: InputDecoration(
                  hintText: 'Serch for Specific Category',
                  suffixIcon: const Icon(FontAwesomeIcons.magnifyingGlass),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
