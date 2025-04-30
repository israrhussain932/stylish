import 'package:flutter/material.dart';

import '../../../constants/images.dart';

class product_list extends StatelessWidget {
  const product_list({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Column(
            children: [
              Image.asset(Images.clothIcon), // Add product image
              const Text('Women Printed Kurta'),
              const Text('₹1500', ),
            ],
          ),
          SizedBox(width: 10,),
          Column(
            children: [
              Image.asset(Images.mens),
              const Text('HRX by Hrithik Roshan'),
              const Text('₹2499  ₹4999  50% Off'),
            ],
          ),
          SizedBox(width: 10,),
          Column(
            children: [
              Image.asset(Images.mens),
              const Text('HRX by Hrithik Roshan'),
              const Text('₹2499  ₹4999  50% Off'),
            ],
          ),
        ],
      ),
    );
  }
}
