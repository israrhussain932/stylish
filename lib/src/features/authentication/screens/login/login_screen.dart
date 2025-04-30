import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:stylish/bottom_navbar.dart';
import 'package:stylish/helpers/helper_function.dart';
import 'package:stylish/src/constants/colors.dart';
import 'package:stylish/src/constants/sizes.dart';
import 'package:stylish/src/features/authentication/screens/login/widgets/Social_Icon.dart';
import 'package:stylish/src/features/authentication/screens/login/widgets/email_textfield.dart';
import 'package:stylish/src/features/authentication/screens/login/widgets/login_button.dart';
import 'package:stylish/src/features/authentication/screens/login/widgets/password_textfield.dart';
import 'package:stylish/src/features/authentication/screens/signup/create_account.dart';
import '../../../../constants/text_strings.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _SignInScreenState();
}
class _SignInScreenState extends State<LoginScreen> {

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
              Texts.LoginTitle,
              style: TextStyle(
                  fontSize: Sizes.spacetbwSection,
                  fontWeight: FontWeight.bold),),
                const Text(
               Texts.LoginTitle1,
               style: TextStyle(
                  fontSize: Sizes.spacetbwSection,
                  fontWeight: FontWeight.bold),),
                SizedBox(height: 15,),
                EmailTextField(),
                 SizedBox(height: 20,),
                 PasswordTextField(hintText: 'Enter password',),
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
                /// elevated button
                LoginButton(
                  text: 'Login',
                  onPressed: ()=> Get.to(NavigationMenu())
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
                      SocialIcon(icon: FontAwesomeIcons.google, onPressed: () {
                       print("ontap");
                      },),
                       SizedBox(width: 10,),
                       SocialIcon(icon: FontAwesomeIcons.apple, onPressed: () {
                         print("ontap");
                       },),
                      SizedBox(width: 10,),
                       SocialIcon(icon: FontAwesomeIcons.facebook, onPressed: () {
                         print("ontap");
                       },),
                    ],
                  ),
                ),

                SizedBox(height: 15,),
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
              ]
      ),
    )
      )
    );
  }
}






