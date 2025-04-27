import 'package:bookly_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
            const SizedBox(width: 40),
            /* /* CustomCategoryButton */ (), */
          ],
        ),
        const SizedBox(height: 23),
      ],
    );
  }
}

class CustomCategoryButton extends StatelessWidget {
  const CustomCategoryButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            height: 50,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
            child: const Row(
              children: [
                Text('Select Category'),
                Expanded(child: SizedBox()),
                Icon(FontAwesomeIcons.arrowDown),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
