import 'package:bookly_app/features/home/data/presentation/views/widgets/detalied_books_view_body.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class DetaliedBooksView extends StatelessWidget {
  const DetaliedBooksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: const Icon(FontAwesomeIcons.x),
        ),
      ),
      body: const DetaliedBooksViewBody(),
    );
  }
}
