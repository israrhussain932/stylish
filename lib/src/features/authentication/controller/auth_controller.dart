import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../bottom_navbar.dart'; // ✅ Update karo sahi path ke hisab se

class AuthController extends GetxController {
  // Firebase instances
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseDatabase _database = FirebaseDatabase.instance;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(); // ✅ Missing tha, ab add kar diya

  // Controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final nameController = TextEditingController();

  /// ✅ Sign In function
  Future<void> signIn() async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      Get.offAll(() => NavigationMenu());
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  /// ✅ Google Sign Up function
  Future<void> signUpWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return;

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential = await _auth.signInWithCredential(credential);
      var user = userCredential.user;

      if (user != null) {
        String uid = user.uid;
        String? fcmToken = await _firebaseMessaging.getToken();

        // ✅ Save to Firestore
        await _firestore.collection('users').doc(uid).set({
          'uid': uid,
          'email': user.email,
          'name': user.displayName ?? '',
          'createdAt': FieldValue.serverTimestamp(),
        });

        // ✅ Save to Realtime Database
        await _database.ref('users/$uid').set({
          'uid': uid,
          'name': user.displayName ?? '',
          'email': user.email,
          'fcmToken': fcmToken,
        });

        Get.offAll(() => NavigationMenu());
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  /// ✅ Email Sign Up function
  Future<void> signUp(String email, String password, String name) async {
    try {
      UserCredential userCredential =
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      var user = userCredential.user;

      if (user != null) {
        String uid = user.uid;
        String? fcmToken = await _firebaseMessaging.getToken();

        // ✅ Save to Firestore
        await _firestore.collection('users').doc(uid).set({
          'uid': uid,
          'email': email,
          'name': name,
          'createdAt': FieldValue.serverTimestamp(),
        });

        // ✅ Save to Realtime Database
        await _database.ref('users/$uid').set({
          'uid': uid,
          'name': name,
          'email': email,
          'fcmToken': fcmToken,
        });

        Get.offAll(() => NavigationMenu());
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  /// ✅ Logout function
  void logout() async {
    await _auth.signOut();
    Get.offAllNamed('/login'); // ⚡ Update karo agar tumhara login screen ka route koi aur hai
  }
  // Background handler function

  /// ✅ Dispose controllers
  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    nameController.dispose();
    super.onClose();
  }
}
