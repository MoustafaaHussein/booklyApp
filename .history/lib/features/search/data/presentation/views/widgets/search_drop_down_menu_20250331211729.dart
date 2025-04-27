import 'package:bookly_app/features/search/data/presentation/models/search_category_model.dart';
import 'package:flutter/material.dart';

class SubjectDropdown extends StatefulWidget {
  const SubjectDropdown({super.key});

  @override
  _SubjectDropdownState createState() => _SubjectDropdownState();
}

class _SubjectDropdownState extends State<SubjectDropdown> {
  SearchCategoryModel? selectedSubject = subjectList.first; // Default selection

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Select a Subject")),
      body: Center(
        child: DropdownButton<SearchCategoryModel>(
          value: selectedSubject,
          onChanged: (SearchCategoryModel? newValue) {
            setState(() {
              selectedSubject = newValue;
            });
          },
          items:
              subjectList.map<DropdownMenuItem<SearchCategoryModel>>((
                SearchCategoryModel subject,
              ) {
                return DropdownMenuItem<SearchCategoryModel>(
                  value: subject,
                  child: Text(subject.subject),
                );
              }).toList(),
        ),
      ),
    );
  }
}
