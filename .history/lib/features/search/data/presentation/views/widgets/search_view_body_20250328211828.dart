import 'package:bookly_app/core/utils/app_routes.dart';
import 'package:bookly_app/features/home/data/presentation/views/widgets/customized_error_message.dart';
import 'package:bookly_app/features/home/data/presentation/views/widgets/customized_loading_indicator.dart';
import 'package:bookly_app/features/search/data/presentation/manger/serch%20specific%20category%20cubit/serch_specific_category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SerchSpecificCategoryCubit, SerchSpecificCategoryState>(
      builder: (context, state) {
        if (state is SerchSpecificCategorySubmitted) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 40,
                ),
                child: TextField(
                  onSubmitted: (value) {
                    BlocProvider.of<SerchSpecificCategoryCubit>(
                      context,
                    ).fetchSpecificCategory(category: value);
                    GoRouter.of(context).push(AppRouters.kHomePath);
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
        } else if (state is SerchSpecificCategoryFailure) {
          return CustomizedErrorMessage(errorMessage: state.errorMessage);
        }
      },
    );
  }
}
