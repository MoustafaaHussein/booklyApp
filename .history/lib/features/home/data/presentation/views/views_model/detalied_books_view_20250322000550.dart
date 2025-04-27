import 'package:bookly_app/features/home/data/presentation/views/widgets/detalied_books_view_body.dart';
import 'package:flutter/material.dart';

class DetaliedBooksView extends StatelessWidget {
  const DetaliedBooksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: const DetaliedBooksViewBody());
  }
}
