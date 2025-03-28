import 'package:bookly_app/core/models/books_model/books_model.dart';
import 'package:bookly_app/features/home/data/presentation/views/widgets/custom_book_button.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BooksActionSection extends StatelessWidget {
  const BooksActionSection({super.key, required this.books});
  final BooksModel books;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16),
      child: Row(
        children: [
          /*    const CustomBookButton(
            textColor: Colors.black,
            displayText: 'Free',
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12),
              topLeft: Radius.circular(12),
            ),
          ), */
          CustomBookButton(
            onPressed: () async {
              Uri uri = Uri.parse(books.volumeInfo.previewLink!);
              if (await canLaunchUrl(uri)) {
                await launchUrl(uri);
              }
            },
            backgroundColor: const Color(0xffEF8262),
            displayText: r'Free preview',
            borderRadius: BorderRadius.circular(12),
          ),
        ],
      ),
    );
  }
}
