import 'package:flutter/material.dart';

class Custom_textfield extends StatelessWidget {
  final Function(String)? onChanged;
  final String hinttext;
  const Custom_textfield({
    super.key, this.onChanged,
    required this.hinttext,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: TextField(
        onChanged: onChanged,
        cursorHeight: 25,
        decoration: InputDecoration(
          hintText: hinttext,
          prefixIcon: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: const Icon(Icons.search),
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: const Icon(Icons.mic),
          ),
          isDense: true,
          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
