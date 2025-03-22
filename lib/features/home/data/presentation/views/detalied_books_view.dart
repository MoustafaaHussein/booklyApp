import 'package:bookly_app/features/home/data/presentation/views/widgets/custom_detalied_books_app_bar.dart';
import 'package:bookly_app/features/home/data/presentation/views/widgets/detalied_books_view_body.dart';
import 'package:flutter/material.dart';

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
