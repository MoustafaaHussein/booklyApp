import 'package:bookly_app/features/search/data/presentation/views/widgets/search_drop_down_menu.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomCategoryButton extends StatefulWidget {
  const CustomCategoryButton({super.key});

  @override
  State<CustomCategoryButton> createState() => _CustomCategoryButtonState();
}

class _CustomCategoryButtonState extends State<CustomCategoryButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          showModalBottomSheet(
            context: context,
            builder: (context) => const SearchSubjectDropDownMenu(),
          );
        });
      },
      child: Row(
        children: [
          Container(
            height: 50,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
            child: const Row(
              children: [
                Text('Select Category'),
                SizedBox(width: 30),
                Icon(FontAwesomeIcons.arrowDown, size: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
