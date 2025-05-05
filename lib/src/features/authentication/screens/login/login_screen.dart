import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:stylish/helpers/helper_function.dart';
import 'package:stylish/src/constants/sizes.dart';
import 'package:stylish/src/features/authentication/controller/auth_controller.dart';
import 'package:stylish/src/features/authentication/screens/login/widgets/Social_Icon.dart';
import 'package:stylish/src/features/authentication/screens/login/widgets/email_textfield.dart';
import 'package:stylish/src/features/authentication/screens/login/widgets/login_button.dart';
import 'package:stylish/src/features/authentication/screens/login/widgets/password_textfield.dart';
import 'package:stylish/src/features/authentication/screens/signup/create_account.dart';
import 'package:stylish/src/util/device/validator.dart';
import '../../../../constants/text_strings.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<LoginScreen> {
  final controller = Get.find<AuthController>(); // ✅ Use GetX properly
  final _formKey = GlobalKey<FormState>();       // ✅ Form key

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Form(                                // ✅ Wrap everything inside Form
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 60),
                Text(
                  Texts.LoginTitle,
                  style: const TextStyle(
                    fontSize: Sizes.spacetbwSection,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  Texts.LoginTitle1,
                  style: TextStyle(
                    fontSize: Sizes.spacetbwSection,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                /// Email Field
                EmailTextField(
                  emailController: controller.emailController,
                  validator: Validator.validateEmail, // ✅ Uses validator
                ),

                const SizedBox(height: 20),

                /// Password Field
                PasswordTextField(
                  hintText: 'Enter password',
                  PasswordController: controller.passwordController,
                  validator: Validator.validatePassword, // ✅ Uses validator
                ),

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(color: Colors.pink),
                    ),
                  ),
                ),

                LoginButton(text: 'Login', onPressed: () {
                  if (controller.emailController.text.isNotEmpty &&
                      controller.passwordController.text.isNotEmpty) {
                  controller.signIn();
                  } else {
                    Get.snackbar("Missing Info", "Please enter both email and password.");
                  }

                }
                ),

                const SizedBox(height: 15),

                const Center(child: Text('- OR Continue with -')),

                const SizedBox(height: 20),

                /// Social Icons
                Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SocialIcon(
                        icon: FontAwesomeIcons.google,
                        onPressed: () {
                          controller.signUpWithGoogle();
                          print("ontap");
                        },
                      ),
                      const SizedBox(width: 10),
                      SocialIcon(
                        icon: FontAwesomeIcons.apple,
                        onPressed: () {
                          print("ontap");
                        },
                      ),
                      const SizedBox(width: 10),
                      SocialIcon(
                        icon: FontAwesomeIcons.facebook,
                        onPressed: () {
                          print("ontap");
                        },
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 15),

                /// Signup Navigation
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(Texts.createAccount),
                    TextButton(
                      onPressed: () {
                        Get.to(CreateAccount());
                      },
                      child: const Text(
                        Texts.Signup,
                        style: TextStyle(color: Colors.pinkAccent),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
