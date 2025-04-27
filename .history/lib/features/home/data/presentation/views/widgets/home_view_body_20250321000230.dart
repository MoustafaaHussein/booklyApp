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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAppBar(),
          const FuturedBookListView(),
          const SizedBox(height: 25),
          Text('Books List', style: AppStyles.styleSemiBold24(context)),
          const SizedBox(height: 20),
          const BooksListView(),
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
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Harry Potter and the Goblet of Fire',
              maxLines: 2,
              style: AppStyles.styleSemiBold20(context),
            ),
            Text(
              'J.K. Rowling',
              style: AppStyles.styleMedium16(
                context,
              ).copyWith(color: const Color(0xff97959E)),
            ),
            Row(
              children: [
                Text(r'19.99$', style: AppStyles.styleBold16(context)),
                const SizedBox(),
                FittedBox(child: Image.asset(Assets.imagesStar)),
                Text('4.8', style: AppStyles.styleMedium16(context)),
                Text(
                  "(2390)",
                  style: AppStyles.styleRegular14(
                    context,
                  ).copyWith(color: const Color(0xff504D5C)),
                ),
              ],
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
