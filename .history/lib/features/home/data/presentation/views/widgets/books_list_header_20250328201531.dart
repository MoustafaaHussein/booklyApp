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
            const CustomCategoryButton(),
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
    return GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          Container(
            height: 50,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
            child: const Row(
              children: [
                Text('Select Category'),
                SizedBox(),
                Icon(FontAwesomeIcons.arrowDown, size: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
