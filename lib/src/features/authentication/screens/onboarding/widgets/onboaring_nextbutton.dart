import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:stylish/src/features/authentication/onboarding_controller/onboarding_controller.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../util/device/device_utils.dart';
import '../../login/login_screen.dart';

class OnBoarding_nextButton extends StatelessWidget {
  const OnBoarding_nextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        right: Sizes.defaultspace,
        bottom: TDeviceUtils.getPixelRatio(),
        child: TextButton(
            onPressed: () {
              Get.to(const LoginScreen());
            },
            child: Text(
              "Next",
              style: TextStyle(color: TColors.buttonPrimary),
            )
        )
    );
  }
}
