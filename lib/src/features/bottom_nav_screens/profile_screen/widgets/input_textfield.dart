import 'package:flutter/material.dart';

class input_textfield extends StatelessWidget {
  final String labelText;

  const input_textfield({
    super.key,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    const labelFontSize = 15.0;
    return SizedBox(
      height: 55,
      child: TextField(
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.black,
          ),
          floatingLabelStyle: TextStyle(
            fontSize: labelFontSize,
            fontWeight: FontWeight.w400,
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.black,
          ),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
