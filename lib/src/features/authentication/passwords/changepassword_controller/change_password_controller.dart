import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController {
  // Text controllers
  final currentPassword = TextEditingController();
  final newPassword = TextEditingController();
  final confirmPassword = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // Obscure toggles
  var isCurrentObscure = true.obs;
  var isNewObscure = true.obs;
  var isConfirmObscure = true.obs;
  // Form key
  final formKey = GlobalKey<FormState>();
  // Firebase instance
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // Get current user dynamically
  User? get currentUser => _auth.currentUser;
  // --- VALIDATORS ---
  String? validateCurrentPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter current password';
    }
    return null;
  }
  String? validateNewPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter new password';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm new password';
    } else if (value != newPassword.text.trim()) {
      return 'Passwords do not match';
    }
    return null;
  }

  // --- PASSWORD CHANGE LOGIC ---
  Future<void> changePassword() async {
    final user = currentUser;
    if (user?.email == null) {
      Get.snackbar('Error', 'User email not found');
      return;
    }
    try {
      // Re-authenticate
      final credential = EmailAuthProvider.credential(
        email: user!.email!,
        password: currentPassword.text.trim(),
      );
      await user.reauthenticateWithCredential(credential);
      // Update password
      await user.updatePassword(confirmPassword.text.trim());
      // Clear fields
      currentPassword.clear();
      newPassword.clear();
      confirmPassword.clear();
      Get.snackbar(
        'Success',
        'Password changed successfully',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withOpacity(0.8),
        colorText: Colors.white,
      );
      updatePassDb(confirmPassword.text.trim());
    } on FirebaseAuthException catch (e) {
      print('FirebaseAuthException: ${e.code} - ${e.message}');
      String message;
      switch (e.code) {
        case 'wrong-password':
          message = 'Current password is incorrect.';
          break;
        case 'weak-password':
          message = 'The new password is too weak.';
          break;
        case 'requires-recent-login':
          message = 'Please log in again and try.';
          break;
        default:
          message = e.message ?? 'Failed to change password.';
      }
      Get.snackbar(
        'Error',
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
      );
    } catch (e) {
      print('Error: $e');
      Get.snackbar(
        'Error',
        'An unexpected error occurred.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
      );
    }
  }

  @override
  void onClose() {
    currentPassword.dispose();
    newPassword.dispose();
    confirmPassword.dispose();
    super.onClose();
  }

  void updatePassDb(String password) async {
    await _firestore.collection('Students').doc(currentUser!.uid).set({
      'password': password,

    });

  }
}
