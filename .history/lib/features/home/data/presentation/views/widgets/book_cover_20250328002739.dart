import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BookCover extends StatelessWidget {
  const BookCover({super.key, required this.imageURl});
  final String imageURl;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: AspectRatio(
        aspectRatio: 2.6 / 4,
        child: CachedNetworkImage(
          errorWidget: (context, url, error) => const Icon(Icons.warning),
          fit: BoxFit.fill,
          imageUrl: imageURl,
        ),
      ),
    );
  }
}
