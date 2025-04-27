import 'package:bookly_app/core/utils/app_images.dart';
import 'package:bookly_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BooksListBody extends StatelessWidget {
  const BooksListBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 2.7 / 4,
            child: Container(
              decoration: ShapeDecoration(
                image: const DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(Assets.imagesTestImage),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),

          const SizedBox(width: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  maxLines: 2,
                  'Harry Potter and the Goblet of Fires',
                  style: AppStyles.styleRegular20(
                    context,
                  ).copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                'J.K. Rowling',
                style: AppStyles.styleMedium14(
                  context,
                ).copyWith(color: const Color(0xff97959E)),
              ),

              SizedBox(
                child: Row(
                  children: [
                    FittedBox(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        r'19.99$',
                        style: AppStyles.styleSemiBold20(context),
                      ),
                    ),
                    const SizedBox(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BooksRating extends StatelessWidget {
  const BooksRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(Assets.imagesRattingImage),
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Text('4.8', style: AppStyles.styleMedium14(context)),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Text(
            "(2390)",
            style: AppStyles.styleRegular14(
              context,
            ).copyWith(color: const Color(0xff504D5C)),
          ),
        ),
      ],
    );
  }
}
