import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  TextEditingController? textEditingController;
  String? label;
   CustomTextField({Key? key, this.textEditingController,this.label}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      controller: textEditingController,
      decoration: InputDecoration(
        label: Text(label??""),
            border: const OutlineInputBorder(),
            enabledBorder: const OutlineInputBorder(),
        focusedBorder: const OutlineInputBorder(),
        errorBorder: const OutlineInputBorder(),
        disabledBorder: const OutlineInputBorder()
      ),
    );
  }
}
