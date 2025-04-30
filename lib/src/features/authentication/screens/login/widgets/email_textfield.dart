import 'package:flutter/material.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField ({
    super.key,
  });
  @override
  Widget build(BuildContext context) {

    return TextField(
      style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400),
      decoration: InputDecoration(
        hintText: ' username or your email',
        hintStyle: const TextStyle(
          fontSize: 14,
        ),
        prefixIcon: const Icon(Icons.person_3_outlined,color: Colors.grey, ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.yellow, width: 1),
        ),
      ),
    );
  }
}
