import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
            child: const Row(
              children: [
                Text('Select Category'),
                Expanded(child: SizedBox()),
                Icon(Icons.arrow_back_ios),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
