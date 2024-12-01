import 'package:flutter/material.dart';

class MyDropdownField extends StatelessWidget {
  final String value;
  final List<String> items;
  final ValueChanged<String?> onChanged; // Modifier le type de onChanged
  final String hintText;

  const MyDropdownField({
    required this.value,
    required this.items,
    required this.onChanged,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade400),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: value,
            onChanged: onChanged,
            items: items.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            isExpanded: true,
            style: TextStyle(color: Colors.grey[500]),
            icon: Icon(Icons.arrow_drop_down),
            iconSize: 36,
          ),
        ),
      ),
    );
  }
}
