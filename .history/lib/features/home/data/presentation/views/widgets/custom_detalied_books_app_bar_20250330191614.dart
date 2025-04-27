import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CustomDetaliedBooksAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  @override
  final Size preferredSize; // Override the preferredSize property

  const CustomDetaliedBooksAppBar({super.key})
    : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kPrimaryColor,
      leading: IconButton(
        onPressed: () {
          GoRouter.of(context).pop();
        },
        icon: const Icon(Icons.arrow_back),
      ),
      actions: [
        IconButton(
          onPressed: () {
            /*  GoRouter.of(context).pop(); */
          },
          icon: Padding(
            padding: const EdgeInsets.only(right: 30.0),
            child: IconButton(
              icon: const Icon(FontAwesomeIcons.magnifyingGlass),
              onPressed: () {
                GoRouter.of(context).push(AppRouters.kSearchView);
              },
            ),
          ),
        ),
      ],
    );
  }
}
