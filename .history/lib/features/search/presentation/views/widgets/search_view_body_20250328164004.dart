import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          child: Container(
            child: const Row(
              children: [
                Text('Select Category'),
                SizedBox(),
                Icon(Icons.arrow_back_ios),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
