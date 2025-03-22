import 'package:bookly_app/core/utils/app_images.dart';
import 'package:bookly_app/core/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          Assets.imagesLogo,
          width: 75,
          height: 16.1,
          fit: BoxFit.contain,
        ),
        const Expanded(child: SizedBox()),
        IconButton(
          onPressed: () {
            GoRouter.of(context).push(AppRouters.kSearchView);
          },
          icon: const Icon(FontAwesomeIcons.magnifyingGlass),
        ),
      ],
    );
  }
}
