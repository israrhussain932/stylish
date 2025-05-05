import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  final String  hintText;
  final TextEditingController PasswordController;
  final String? Function(String?)? validator;
  const PasswordTextField({super.key,
    required this.hintText,
    required this.PasswordController,
    this.validator,


  });

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}
class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _obscureText = true;
  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  @override
  Widget build(BuildContext context) {
    return TextFormField(
       controller: widget.PasswordController,
      validator: widget.validator,
      obscureText: _obscureText,
      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
      decoration: InputDecoration(
        hintText: widget.hintText,
        prefixIcon: const Icon(Icons.lock),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
          ),
          onPressed: _togglePasswordVisibility,
        ),
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
