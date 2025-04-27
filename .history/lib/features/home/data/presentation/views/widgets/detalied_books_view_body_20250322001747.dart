import 'package:bookly_app/core/utils/app_images.dart';
import 'package:flutter/material.dart';

class DetaliedBooksViewBody extends StatelessWidget {
  const DetaliedBooksViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AspectRatio(
          aspectRatio: 2.7 / 4,
          child: Container(
            decoration: ShapeDecoration(
              image: const DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(Assets.imagesTestImage),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
