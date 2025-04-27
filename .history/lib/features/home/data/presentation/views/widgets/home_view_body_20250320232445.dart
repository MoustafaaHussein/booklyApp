import 'package:bookly_app/features/home/data/presentation/views/featured_book_list_view.dart';
import 'package:bookly_app/features/home/data/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly_app/utils/app_styles.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 40),
          child: CustomAppBar(),
        ),
        const FuturedBookListView(),
        const SizedBox(height: 25),
        Text(
          'Books List',
          style: AppStyles.styleSemiBold24(
            context,
          ).copyWith(color: Colors.white),
        ),
      ],
    );
  }
}
