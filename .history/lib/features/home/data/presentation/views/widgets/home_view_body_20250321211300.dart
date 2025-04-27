import 'package:bookly_app/features/home/data/presentation/views/featured_book_list_view.dart';
import 'package:bookly_app/features/home/data/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly_app/utils/app_images.dart';
import 'package:bookly_app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(),
          Expanded(flex: 2, child: FuturedBookListView()),
          SizedBox(height: 20),
          Expanded(flex: 3, child: BookListHeader()),
        ],
      ),
    );
  }
}

class BooksListBody extends StatelessWidget {
  const BooksListBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(Assets.imagesTestImage2),
        const SizedBox(width: 30),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 250,
              child: Text(
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                maxLines: 2,
                'Harry Potter and the Goblet of Fires',

                style: AppStyles.styleRegular20(context),
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
                  const SizedBox(width: 100),
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
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class BooksListView extends StatelessWidget {
  const BooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 10),
      itemBuilder: (context, index) {
        return const BooksListBody();
      },
    );
  }
}

class BookListHeader extends StatelessWidget {
  const BookListHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Books List', style: AppStyles.styleSemiBold18(context)),
        const SizedBox(height: 23),
        const BooksListBody(),
      ],
    );
  }
}
