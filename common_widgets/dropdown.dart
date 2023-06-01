import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  @override
  CustomDropdownState createState() => CustomDropdownState();
  final List<String> items;
  final String title;
  const CustomDropdown({Key? key, required this.title, required this.items}) : super(key: key);

}

class CustomDropdownState extends State<CustomDropdown> {
    String? _selectedOption;


  @override
  Widget build(BuildContext context) {
    return Card(
      child: DropdownButton<String>(
        underline: Container(),
        value: _selectedOption??widget.items[0],
        hint: Text(widget.title),
        onChanged: (newValue) {
          setState(() {
            _selectedOption = newValue!;
          });
        },
        items: widget.items.map((String option) {
          return DropdownMenuItem<String>(
            value: option,
            child: Text(option),
          );
        }).toList(),
      ),
    );
  }
}
