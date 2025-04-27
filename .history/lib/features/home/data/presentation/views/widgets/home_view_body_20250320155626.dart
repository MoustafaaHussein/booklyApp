import 'package:bookly_app/features/home/data/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly_app/utils/app_images.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 40),
          child: CustomAppBar(),
        ),
        CustomListViewItem(),
      ],
    );
  }
}

class CustomListViewItem extends StatelessWidget {
  const CustomListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      decoration: ShapeDecoration(
        image: const DecorationImage(image: AssetImage(Assets.imagesTestImage)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
