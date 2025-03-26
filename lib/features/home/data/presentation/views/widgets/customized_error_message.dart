import 'package:bookly_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomizedErrorMessage extends StatelessWidget {
  const CustomizedErrorMessage({super.key, required this.errorMessage});
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.red,
      child: ListTile(
        leading: const Icon(Icons.warning, color: Colors.white),
        title: Text(errorMessage, style: AppStyles.styleBold16(context)),
      ),
    );
  }
}
