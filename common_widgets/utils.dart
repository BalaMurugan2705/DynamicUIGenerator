import 'package:flutter/cupertino.dart';

class TitleText extends StatelessWidget {
  String? data;
   TitleText(this.data,{
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Text("$data    :",style: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),);
  }
}