import 'package:flutter/material.dart';

class CategoryDropdownList extends StatelessWidget {
  CategoryDropdownList({Key? key}) : super(key: key);

  final List<String> categories = [
    "Все",
    "Windows",
    "Mobile",
    "Mobile",
    "Mobile",
    "Mobile",
    "Mobile",
    "Mobile",
    "Mobile",
    "Mobile",
    "Mobile",
    "Mobile",
    "Mobile",
    "Mobile",
    "Mobile",
    "Mobile",
    "Mobile",
    "Mobile",
    "Mobile",
    "Mobile",
    "Mobile",
    "Mobile"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: InputDecorator(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            menuMaxHeight: 300,
            value: categories[0],
            hint: Text('Выберите категорию'),
            isDense: true,
            onChanged: (newValue) {
              print(newValue);
            },
            items: categories.map((String value) {
              return DropdownMenuItem(
                value: value,
                child: Text(
                  value,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black54,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
