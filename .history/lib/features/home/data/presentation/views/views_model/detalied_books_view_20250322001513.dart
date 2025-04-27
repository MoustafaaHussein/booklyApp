import 'package:bookly_app/features/home/data/presentation/views/widgets/detalied_books_view_body.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class DetaliedBooksView extends StatelessWidget {
  const DetaliedBooksView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomDetaliedBooksAppBar(),
      body: DetaliedBooksViewBody(),
    );
  }
}

class CustomDetaliedBooksAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  @override
  final Size preferredSize; // Override the preferredSize property

  const CustomDetaliedBooksAppBar({super.key})
    : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          GoRouter.of(context).pop();
        },
        icon: const Icon(FontAwesomeIcons.x),
      ),
      actions: [
        IconButton(
          onPressed: () {
            /*  GoRouter.of(context).pop(); */
          },
          icon: const Padding(
            padding: EdgeInsets.only(right: 30.0),
            child: Icon(FontAwesomeIcons.cartShopping),
          ),
        ),
      ],
    );
  }
}
