import 'package:flutter/material.dart';

class SocialIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const SocialIcon({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: const CircleBorder(),
      color: Colors.transparent,
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: () {
          debugPrint("Tapped on social icon: $icon");
          onPressed();
        },
        child: Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.pink,
              width: 2,
            ),
          ),
          child: CircleAvatar(
            radius: 23,
            backgroundColor: Colors.purple.shade100,
            child: Icon(icon, color: Colors.green),
          ),
        ),
      ),
    );
  }
}
