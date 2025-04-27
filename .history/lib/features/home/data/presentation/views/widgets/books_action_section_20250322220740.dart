import 'package:bookly_app/features/home/data/presentation/views/widgets/custom_book_button.dart';
import 'package:flutter/material.dart';

class BooksActionSection extends StatelessWidget {
  const BooksActionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16),
      child: Row(
        children: [
          CustomBookButton(
            textColor: Colors.black,
            displayText: r'19.99$',
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12),
              topLeft: Radius.circular(12),
            ),
          ),
          CustomBookButton(
            backgroundColor: Color(0xffEF8262),
            displayText: r'Free preview',
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
          ),
        ],
      ),
    );
  }
}
