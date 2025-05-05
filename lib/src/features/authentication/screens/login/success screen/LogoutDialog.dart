import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../constants/colors.dart';

class LogoutDialog {
  static void showLogoutDialog({
    required VoidCallback onConfirm,
  }) {
    Get.defaultDialog(
      backgroundColor: TColors.warning,
      title: "Logout",
      titleStyle: TextStyle(color: Colors.white),
      middleText: "Are you sure you want to log out?",
      middleTextStyle: TextStyle(color: Colors.white),
      textConfirm: "Yes",
      textCancel: "No",
      confirmTextColor: Colors.white,
      onConfirm: () {
        Get.back(); // Close the dialog
        onConfirm(); // Call the logout function
      },
      onCancel: () {
        Get.back();
      },
    );
  }
}
