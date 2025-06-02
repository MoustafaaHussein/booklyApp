import 'package:bookly_app/core/utils/app_routes.dart';
import 'package:bookly_app/core/utils/app_styles.dart';
import 'package:bookly_app/features/home/domain/entities/books_entity.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_cover.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/books_ratting.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BooksListBody extends StatelessWidget {
  const BooksListBody({super.key, required this.items});

  final BooksEntity items;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          () => GoRouter.of(
            context,
          ).push(AppRouters.kDetailedBookView, extra: items),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        height: 125,
        child: Row(
          children: [
            BookCover(imageURl: items.image),

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
                      items.title,
                      style: AppStyles.styleRegular20(
                        context,
                      ).copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  FittedBox(
                    child: Text(
                      items.author,
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
                          'Free',
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
