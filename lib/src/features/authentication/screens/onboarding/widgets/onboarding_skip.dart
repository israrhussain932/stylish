
import 'package:flutter/material.dart';
import 'package:stylish/src/features/authentication/onboarding_controller/onboarding_controller.dart';

import '../../../../../constants/sizes.dart';
import '../../../../../util/device/device_utils.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: TDeviceUtils.getAppBarHeight(),
        right: Sizes.defaultspace,
        child: TextButton(onPressed: ()=>OnBoardingController.instance.skipPage(),
            child: Text("Skip")));
  }
}

