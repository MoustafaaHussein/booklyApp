import 'package:bookly_app/core/utils/app_styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/suggested_books_list_view.dart';
import 'package:flutter/material.dart';

class SuggestedBooks extends StatelessWidget {
  const SuggestedBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("You May Also Like ", style: AppStyles.styleSemiBold18(context)),
        const SuggestedBooksListView(),
      ],
    );
  }
}
