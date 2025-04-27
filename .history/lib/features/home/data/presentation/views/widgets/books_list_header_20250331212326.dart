import 'package:bookly_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookListHeader extends StatelessWidget {
  const BookListHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('Books List', style: AppStyles.styleSemiBold18(context)),
            const SizedBox(width: 40),
            const CustomCategoryButton(),
          ],
        ),
        const SizedBox(height: 23),
      ],
    );
  }
}

class CustomCategoryButton extends StatefulWidget {
  const CustomCategoryButton({super.key});

  @override
  State<CustomCategoryButton> createState() => _CustomCategoryButtonState();
}

class _CustomCategoryButtonState extends State<CustomCategoryButton> {
  String selectedCategory = "Select Category"; // Default text
  List<String> categories = [
    "Art",
    "Biography",
    "Business",
    "Comics",
    "Computers",
    "Cooking",
  ]; // List of categories

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value:
              selectedCategory == "Select Category" ? null : selectedCategory,
          hint: const Text("Select Category"),
          icon: const Icon(FontAwesomeIcons.arrowDown, size: 20),
          items:
              categories.map((String category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              selectedCategory = newValue!;
            });
          },
        ),
      ),
    );
  }
}
