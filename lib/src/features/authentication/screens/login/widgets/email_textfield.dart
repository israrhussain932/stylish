import 'package:flutter/material.dart';

class EmailTextField extends StatelessWidget {
  final TextEditingController emailController;
  final String? Function(String?)? validator;

  const EmailTextField({
    super.key,
    required this.emailController,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailController,
      validator: validator,
      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
      decoration: InputDecoration(
        hintText: 'Username or your email',
        hintStyle: const TextStyle(fontSize: 14),
        prefixIcon: const Icon(Icons.person_3_outlined, color: Colors.grey),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.yellow, width: 1),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    );
  }
}
