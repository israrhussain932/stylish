import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stylish/src/features/authentication/onboarding_controller/onboarding_controller.dart';

import '../../../../../../helpers/helper_function.dart';
import '../../../../../constants/colors.dart';
import '../../../../../util/device/device_utils.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final dark  = HelperFunctions.isDarkMode(context);
    return Positioned(
        left: 130,
        bottom: TDeviceUtils.getStatusBarHeight(),
        child: SmoothPageIndicator(
          controller: controller.pageController,
          onDotClicked: controller.dotNavigationClick,
          count:3,
          effect: ExpandingDotsEffect(activeDotColor: dark? TColors.light:TColors.dark,dotHeight: 5),
        )
    );
  }
}