import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:stylish/src/constants/text_strings.dart';
import 'package:stylish/src/features/authentication/onboarding_controller/onboarding_controller.dart';
import 'package:stylish/src/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:stylish/src/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:stylish/src/features/authentication/screens/onboarding/widgets/onboardingpage.dart';
import 'package:stylish/src/features/authentication/screens/onboarding/widgets/onboaring_nextbutton.dart';
import '../../../../constants/images.dart';
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          /// horizontal scrollable pages
          PageView(
            controller: controller.pageController,
            onPageChanged:  controller.updatePageIndicator,
            children: [
              OnBoardingPage(
                image: Images.onBoardingImage1,
                title: Texts.onBoardingTitle1,
                subtitle: Texts.onBordingSubtitle1,
              ),
              OnBoardingPage(
                image: Images.onBoardingImages2,
                title: Texts.onboardingTitle2,
                subtitle: Texts.onBordingSubtitle1,
              ),
              OnBoardingPage(
                image: Images.onBoardingImages3,
                title: Texts.onboardingTitle3,
                subtitle: Texts.onBordingSubtitle1,
              ),
            ],
          ),
          /// skip button
          OnBoardingSkip(),
          /// smooth page indicator
          OnBoardingDotNavigation(),
          /// Circular button
          OnBoarding_nextButton()
        ],
      ),
    );
  }
}

