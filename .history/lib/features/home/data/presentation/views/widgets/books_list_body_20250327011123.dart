import 'package:bookly_app/core/utils/app_images.dart';
import 'package:bookly_app/core/utils/app_routes.dart';
import 'package:bookly_app/core/utils/app_styles.dart';
import 'package:bookly_app/features/home/data/presentation/views/widgets/book_cover.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class BooksListBody extends StatelessWidget {
  const BooksListBody({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.author,
    required this.price,
  });
  final String imageUrl, title, author, price;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GoRouter.of(context).push(AppRouters.kDetailedBookView),
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 2.7 / 4,
              child: BookCover(imageURl: imageUrl),
            ),

            const SizedBox(width: 30),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      maxLines: 2,
                      title,
                      style: AppStyles.styleRegular20(
                        context,
                      ).copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  FittedBox(
                    child: Text(
                      author,
                      style: AppStyles.styleMedium14(
                        context,
                      ).copyWith(fontSize: 16, color: const Color(0xff97959E)),
                    ),
                  ),

                  Row(
                    children: [
                      FittedBox(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          price,
                          style: AppStyles.styleSemiBold20(context),
                        ),
                      ),
                      const Spacer(),
                      const BooksRating(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
