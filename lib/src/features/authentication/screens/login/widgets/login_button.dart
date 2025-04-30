import 'package:flutter/material.dart';

import '../../../../../constants/colors.dart';

class LoginButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed; // 👈 this allows passing a function


  const LoginButton({
    super.key,
    required this.text,
    required this.onPressed,

  });

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: TColors.buttonPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(widget.text, style: TextStyle(fontSize: 16,color: TColors.white,fontWeight: FontWeight.w500)),

      ),
    );
  }
}