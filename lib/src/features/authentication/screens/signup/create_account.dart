import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:stylish/helpers/helper_function.dart';
import 'package:stylish/src/constants/sizes.dart';
import 'package:stylish/src/features/authentication/controller/auth_controller.dart';
import 'package:stylish/src/features/authentication/screens/login/login_screen.dart';
import 'package:stylish/src/features/authentication/screens/login/widgets/Social_Icon.dart';
import 'package:stylish/src/features/authentication/screens/login/widgets/email_textfield.dart';
import 'package:stylish/src/features/authentication/screens/login/widgets/login_button.dart';
import 'package:stylish/src/features/authentication/screens/login/widgets/password_textfield.dart';
import 'package:stylish/src/util/device/validator.dart';
import '../../../../constants/text_strings.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final controller = Get.find<AuthController>(); // ✅ Reuse instance
  final _formKey = GlobalKey<FormState>();       // ✅ Correctly for the Form

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Form(                          // ✅ Wrap inside Form
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 60),
                Text(
                  Texts.signupTitle,
                  style: const TextStyle(
                    fontSize: Sizes.spacetbwSection,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),

                /// Email Field
                EmailTextField(
                  emailController: controller.emailController,
                  validator: Validator.validateEmail,
                ),
                const SizedBox(height: 20),

                /// Password Field
                PasswordTextField(
                  hintText: 'Password',
                  PasswordController: controller.passwordController,
                  validator: Validator.validatePassword,
                ),
                const SizedBox(height: 20),

                /// Confirm Password Field
                PasswordTextField(
                  hintText: 'Confirm password',
                  PasswordController: controller.confirmPasswordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Confirm your password';
                    }
                    if (value != controller.passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 15),
                Text(
                  Texts.agreeTo,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                const SizedBox(height: 25),

                /// Create Account Button
                LoginButton(
                  text: 'Create Account',
                  onPressed: () {
                   controller.signUp();
                  },
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
                        onPressed: () {},
                      ),
                      const SizedBox(width: 10),
                      SocialIcon(
                        icon: FontAwesomeIcons.apple,
                        onPressed: () {},
                      ),
                      const SizedBox(width: 10),
                      SocialIcon(
                        icon: FontAwesomeIcons.facebook,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 15),

                /// Go to Login
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(Texts.orSignup),
                    TextButton(
                      onPressed: () {
                        Get.to(LoginScreen());
                      },
                      child: const Text(
                        Texts.signIn,
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
