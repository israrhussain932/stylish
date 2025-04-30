import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../../../helpers/helper_function.dart';
import '../../../../../constants/sizes.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,

  });
  final String image,title,subtitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:Sizes.spacetbwSection),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
              height: HelperFunctions.screenHeight() * 0.4,
              width: HelperFunctions.screenWidth() * 0.8,
              image: AssetImage(image)),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          SizedBox(height:Sizes.spacebtwItems ),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),

        ],
      ),
    );
  }
}
