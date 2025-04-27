import 'package:bookly_app/core/utils/app_styles.dart';
import 'package:bookly_app/features/search/data/presentation/views/widgets/search_subject_List_view.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 30),
        Text('Category', style: AppStyles.styleRegular20(context)),
        const SearchSubjectListView(),
        const Expanded(child: SizedBox()),
      ],
    );
  }

  /* BlocBuilder<SerchSpecificCategoryCubit, SerchSpecificCategoryState>(
      builder: (context, state) {
        if (state is SerchSpecificCategoryInitial) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: IconButton(
                  onPressed: () {
                    GoRouter.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  onSubmitted: (value) {
                    BlocProvider.of<SerchSpecificCategoryCubit>(
                      context,
                    ).fetchSpecificCategory(category: value);
                    BlocProvider.of<FeaturedBooksCubit>(
                      context,
                    ).fetchFeaturedBooks(category: value);
                    BlocProvider.of<NewestBooksCubit>(
                      context,
                    ).fetchNewestBooks(category: value);
                    GoRouter.of(
                      context,
                    ).push(AppRouters.kHomePath, extra: value);
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
        } else {
          return const Text('Hello');
        }
      },
    );
  } */
}
