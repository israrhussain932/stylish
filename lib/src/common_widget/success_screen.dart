
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:stylish/src/features/authentication/screens/login/login_screen.dart';
import 'package:stylish/src/features/authentication/screens/login/widgets/login_button.dart';
import 'package:stylish/src/features/authentication/screens/signup/create_account.dart';
import '../../helpers/helper_function.dart';
import '../constants/images.dart';
import '../constants/sizes.dart';
import '../constants/text_strings.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key, });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ///images
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Image(
                image: const AssetImage(Images.LightAppLogo),
                width: HelperFunctions.screenWidth() * 0.6,
              ),
            ),
            const SizedBox(
              height: Sizes.spacetbwSection,
            ),

            /// title and sub title
            Text(
              Texts.yourAccountCreateTitle,
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: Sizes.spacebtwItems,
            ),
            Text(
              Texts.yourAccountCreateSubtitle,
              style: Theme.of(context).textTheme.labelMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: Sizes.spacetbwSection,
            ),

            /// Buttons
            LoginButton(text: Texts.tContinue,
                onPressed: (){
              print('click');
              Get.off(LoginScreen());
                }


            )
          ],
        ),
      ),
    );
  }
}
