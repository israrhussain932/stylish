import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:stylish/src/features/authentication/screens/login/login_screen.dart';
import '../../../../bottom_navbar.dart';
class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  @override
  void onReady() {
    super.onReady();
    // Listen to authentication state changes
    _auth.authStateChanges().listen(_authStateChanged);
  }
  // Called whenever the authentication state changes (login/logout)
  void _authStateChanged(User? user) {
    if (user == null) {
      // Redirect to login if user is logged out
      Get.offAll(() => LoginScreen());
    } else {
      // Redirect to home page if user is logged in
      Get.offAll(() => NavigationMenu());
    }
  }
  // Login method
  Future<User?> signIn() async {

    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    try {
      // Sign in with email and password
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Check if login was successful and navigate to home
      if (userCredential.user != null) {
        Get.offAll(() => NavigationMenu()); // Navigate to home page
        return userCredential.user;
      }
    } on FirebaseAuthException catch (e) {
      // Handle errors from Firebase Authentication
      if (e.code == 'user-not-found') {
        Get.snackbar("Login Failed", "No user found with this email.");
      } else if (e.code == 'wrong-password') {
        Get.snackbar("Login Failed", "Incorrect password.");
      } else {
        Get.snackbar(
          backgroundColor: Colors.red,
            "Login Failed", e.message ?? "Something went wrong.");
      }
    } catch (e) {
      // Handle unexpected errors
      Get.snackbar("Login Failed", "An unexpected error occurred.");
      print("Login error: $e");
    }
    return null;
  }
 // Sign-up method
  Future signUp() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    try {
      // Create a new user
      UserCredential data = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      // Save user data in Firestore
      await _firestore.collection('Students').doc(data.user!.uid).set({
        'email': email,
        'password': password,
        'uid': data.user!.uid,
      });

      // Navigate to home after successful sign-up
      Get.offAll(() => NavigationMenu());
    } catch (error) {
      // Handle sign-up errors
      Get.snackbar("Sign-Up Failed", "An error occurred: $error");
    }
  }
 // Logout method
  Future<void> logout() async {
    try {
      await _auth.signOut();
      Get.offAll(() => LoginScreen()); // Navigate back to login screen
    } catch (e) {
      // Handle logout errors
      Get.snackbar(
          "Logout Failed", "An error occurred while logging out.");
      print("Logout error: $e");
    }
  }
  // Store user data in Firestore
  storeUserData({String? name, String? password, String? email}) async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      Get.snackbar("Error", "No user is logged in.");
      return;
    }
    DocumentReference store = _firestore.collection('user').doc(currentUser.uid);
    store.set({
      'name': name ?? "Unknown",
      'password': password ?? "Unknown",
      'email': email ?? "Unknown",
      'image url': 'assets/images/Shopping bag-rafiki 1.png',
    });
  }
  // Google sign-up method
  Future<UserCredential?> signUpWithGoogle() async {
    try {
      // Trigger Google Sign-In
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return null; // User canceled Google sign-in

      // Get Google auth details
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // Create Firebase credential
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase with Google credentials
      UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

      // Check if new user and save additional data if needed
      if (userCredential.additionalUserInfo?.isNewUser ?? false) {
        await FirebaseFirestore.instance.collection('users').doc(userCredential.user?.uid).set({
          'name': userCredential.user?.displayName,
          'email': userCredential.user?.email,
          'photoUrl': userCredential.user?.photoURL,
          'createdAt': FieldValue.serverTimestamp(),
        });
      }

      // Navigate to home page after successful sign-in
      Get.offAll(() => NavigationMenu());
      return userCredential;
    } catch (e) {
      print('Google Sign-Up Error: $e');
      return null;
    }
  }
}
