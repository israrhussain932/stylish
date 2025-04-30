import 'package:flutter/material.dart';
import 'package:stylish/src/constants/colors.dart';

class SocialIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  const SocialIcon({
    required this.icon,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(2), // Border width
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: TColors.buttonPrimary,
            width: 2, // Border thickness
          ),
        ),
        child: CircleAvatar(
          radius: 23,
          backgroundColor: Colors.purple.shade100,
          child: Icon(icon, color: Colors.green),
        ),
      ),
    );
  }
}
