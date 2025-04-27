import 'package:bookly_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomBookButton extends StatelessWidget {
  const CustomBookButton({
    super.key,
    this.backgroundColor,
    this.textColor,
    required this.displayText,
    required this.borderRadius,
  });
  final Color? backgroundColor;
  final Color? textColor;
  final String displayText;
  final BorderRadius borderRadius;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 17.5),
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.white,
          borderRadius: borderRadius,
        ),

        child: TextButton(
          onPressed: () {},
          child: FittedBox(
            child: Text(
              displayText,
              style: AppStyles.styleSemiBold20(
                context,
              ).copyWith(color: textColor ?? Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
 /* Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xffEF8262),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 14,
                    horizontal: 31,
                  ),
                  child: FittedBox(
                    child: Text(
                      'Free Preview',
                      style: AppStyles.styleSemiBold24(context),
                    ),
                  ),
                ),
              ),
            ),
          ), */