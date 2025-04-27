import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          onSubmitted: (value) {},
          decoration: const InputDecoration(
            hintText: "search",
            suffixIcon: Icon(Icons.search),
          ),
        ),
      ],
    );
  }
}
