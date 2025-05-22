import 'package:bookly_app/core/utils/app_styles.dart';
import 'package:bookly_app/features/home/data/presentation/views/widgets/custom_category_button.dart';
import 'package:flutter/material.dart';

class BookListHeader extends StatelessWidget {
  const BookListHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('Books List', style: AppStyles.styleSemiBold18(context)),
            const Expanded(child: SizedBox(width: 80)),
            const CustomCategoryButton(),
          ],
        ),
        const SizedBox(height: 23),
      ],
    );
  }
}
