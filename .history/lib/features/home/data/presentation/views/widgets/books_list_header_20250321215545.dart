import 'package:bookly_app/core/utils/app_styles.dart';
import 'package:bookly_app/features/home/data/presentation/views/widgets/books_list_view.dart';
import 'package:flutter/material.dart';

class BookListHeader extends StatelessWidget {
  const BookListHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Books List', style: AppStyles.styleSemiBold18(context)),
        const SizedBox(height: 23),
        const Expanded(child: BooksListView()),
      ],
    );
  }
}
