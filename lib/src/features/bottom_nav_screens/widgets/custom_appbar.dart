import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class CustomMainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String logoPath;
  final String profileImagePath;
  final VoidCallback? onMenuPressed;

  const CustomMainAppBar({
    super.key,
    required this.title,
    required this.logoPath,
    required this.profileImagePath,
    this.onMenuPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.menu, color: TColors.buttonDisabled),
        onPressed: onMenuPressed ?? () {},
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: AssetImage(logoPath), width: 30),
          const SizedBox(width: 5),
          Text(title, style: const TextStyle(color: TColors.primary)),
        ],
      ),
      actions: [
        CircleAvatar(
          backgroundColor: Colors.grey.shade300,
          backgroundImage: AssetImage(profileImagePath),
          radius: 23,
        ),
        const SizedBox(width: 10),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
