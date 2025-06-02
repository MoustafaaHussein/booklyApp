import 'package:bookly_app/core/utils/app_images.dart';
import 'package:bookly_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BooksRating extends StatelessWidget {
  const BooksRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FittedBox(child: SvgPicture.asset(Assets.imagesRattingImage)),
        Padding(
          padding: const EdgeInsets.only(left: 9),
          child: FittedBox(
            child: Text('4.8', style: AppStyles.styleMedium14(context)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 9),
          child: FittedBox(
            child: Text(
              "(2390)",
              style: AppStyles.styleRegular14(
                context,
              ).copyWith(color: const Color(0xff504D5C)),
            ),
          ),
        ),
      ],
    );
  }
}
