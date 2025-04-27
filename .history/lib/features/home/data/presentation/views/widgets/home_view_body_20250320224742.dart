import 'package:bookly_app/features/home/data/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly_app/features/home/data/presentation/views/widgets/custom_list_view_items.dart';
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

class FuturedBookListView extends StatelessWidget {
  const FuturedBookListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.only(left: 8.0, top: 8, bottom: 8),
          child: CustomListViewItem(),
        );
      },
    );
  }
}
