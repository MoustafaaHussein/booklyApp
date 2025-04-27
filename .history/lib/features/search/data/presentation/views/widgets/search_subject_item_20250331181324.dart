import 'package:bookly_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class SearchSubjectItem extends StatelessWidget {
  const SearchSubjectItem({super.key, required this.subject});
  final String subject;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Category', style: AppStyles.styleSemiBold16(context)),
        Container(
          padding: const EdgeInsets.only(top: 12, bottom: 12, left: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.black),
          ),
          child: Text(
            'selected subject',
            style: AppStyles.styleSemiBold18(
              context,
            ).copyWith(color: Colors.black),
          ),
        ),
      ],
    );
  }
}
