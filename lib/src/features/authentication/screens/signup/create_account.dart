import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:stylish/helpers/helper_function.dart';
import 'package:stylish/src/constants/sizes.dart';
import 'package:stylish/src/features/authentication/screens/login/login_screen.dart';
import 'package:stylish/src/features/authentication/screens/login/widgets/Social_Icon.dart';
import 'package:stylish/src/features/authentication/screens/login/widgets/email_textfield.dart';
import 'package:stylish/src/features/authentication/screens/login/widgets/login_button.dart';
import 'package:stylish/src/features/authentication/screens/login/widgets/password_textfield.dart';
import 'package:stylish/src/features/authentication/screens/signup/texts/verify_screen.dart';
import '../../../../constants/text_strings.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({super.key});
  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(12),
            child: SingleChildScrollView(
              child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                SizedBox(height: 60),
                Text(
                  Texts.signupTitle,
                  style: TextStyle(
                      fontSize: Sizes.spacetbwSection,
                      fontWeight: FontWeight.bold),),

                SizedBox(height: 15,),
                EmailTextField(),
                SizedBox(height: 20,),
                PasswordTextField(hintText: 'password',),
               SizedBox(height: 20,),
               PasswordTextField(hintText: 'Confirm password',),
               SizedBox(height: 15,),
                /// elevated button
                Text(Texts.agreeTo,style: Theme.of(context).textTheme.labelMedium,),
                SizedBox(height: 25,),
                LoginButton(text: 'Create Account',
                  onPressed: () => Get.to(() => const VerifyEmailScreen()),

                ),
                SizedBox(height: 15,),
                /// divider
                const Center(child: Text('- OR Continue with -')),
                SizedBox(height: 20,),
                Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SocialIcon(icon: FontAwesomeIcons.google, onPressed: () {},),
                      SizedBox(width: 10,),
                      SocialIcon(icon: FontAwesomeIcons.apple, onPressed: () {},),
                      SizedBox(width: 10,),
                      SocialIcon(icon: FontAwesomeIcons.facebook, onPressed: () {
                      },),
                    ],
                  ),
                ),

                SizedBox(height: 15,),
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
              ]
              ),
            )
        )
    );
  }
}






