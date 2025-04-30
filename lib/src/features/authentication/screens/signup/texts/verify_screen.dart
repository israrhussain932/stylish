import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylish/src/features/authentication/screens/login/widgets/login_button.dart';
import '../../../../../../helpers/helper_function.dart';
import '../../../../../common_widget/success_screen.dart';
import '../../../../../constants/images.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';
import '../../login/login_screen.dart';
class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () => Get.offAll(() => const LoginScreen()),
                icon: const Icon(CupertinoIcons.clear))
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(Sizes.defaultspace),
            child: Column(
              children: [
                ///images
                Image(
                  image: const AssetImage(Images.LightAppLogo),
                  width: HelperFunctions.screenWidth() * 0.6,
                ),
                const SizedBox(
                  height: Sizes.spacetbwSection,
                ),

                /// title and sub title
                Text(
                  Texts.confirmEmail,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: Sizes.spacebtwItems,
                ),
                Text(
                  "@Developer Israr hussain Butt",
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: Sizes.spacebtwItems,
                ),
                Text(
                  Texts.confirmEmailSubtitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: Sizes.spacetbwSection,),

                ///Button
             LoginButton(text: Texts.tContinue, onPressed: (){}),
                SizedBox(
                  height: Sizes.spacebtwItems,),

              LoginButton(text: Texts.resendEmail, onPressed: ()=> Get.to(SuccessScreen())
              
              
              
              ),
              ],
            ),
          ),
        ));
  }
}

