import 'package:bookly_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class SearchSubjectItem extends StatelessWidget {
  const SearchSubjectItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Category', style: AppStyles.styleSemiBold16(context)),
        Container(
          padding: const EdgeInsets.only(top: 12, bottom: 12, left: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
