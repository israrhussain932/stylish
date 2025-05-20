import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../authentication/product_detail/productdetailscreen.dart';
class conainerWidget extends StatelessWidget {
  final String image;
  final String text;
  const conainerWidget({
    super.key,
    required this.image,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()async{
        Get.to(ProductDetailScreen());},
      child: Column(
        children: [
          Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(100),
              ),
              child: CircleAvatar(
                backgroundImage: NetworkImage(image) as ImageProvider,
              )
          ),
          Text(text)
        ],
      ),
    );
  }
}
