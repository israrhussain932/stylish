import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:stylish/src/constants/sizes.dart';
import 'package:stylish/src/features/authentication/product_detail/productdetailscreen.dart';
import 'package:stylish/src/features/bottom_nav_screens/widgets/all_features.dart';
import 'package:stylish/src/features/bottom_nav_screens/widgets/custom_appbar.dart';
import 'package:stylish/src/features/bottom_nav_screens/widgets/custom_textfield.dart';
import '../../constants/images.dart';
class Wishlist extends StatelessWidget {
  Wishlist({super.key});
  final List<Map<String, String>> products = [
    {
      'image': 'assets/items/switer.png',
      'title': 'Black Winter',
      'subtitle': 'Autumn And Winter Casual cotton-padded jacket...',
      'price': '₹499',
      'rating': '4.5',
    },
    {
      'image': 'assets/items/shirt.png',
      'title': 'Mens Starry',
      'subtitle': 'Mens Starry Sky Printed Shirt 100%Cotton Fabric',
      'price': '₹399',
      'rating': '4.2',
    },
    {
      'image': 'assets/items/black women dress.png',
      'title': 'Black Dress',
      'subtitle': 'Solid Black Dress for Women, Sexy Chain Shorts Ladi...',
      'price': '₹2,000',
      'rating': '4.7',
    },
    {
      'image': 'assets/items/pink women dress.png',
      'title': 'Pink Embroide...',
      'subtitle': 'EARTHEN Rose Pink Embroidered Tiered Max....',
      'price': '₹1,900',
      'rating': '4.3',
    },
    {
      'image': 'assets/items/denim blue.png',
      'title': 'Denim Dress',
      'subtitle': 'Blue cotton denim dress Look 2 Printed cotton dr...',
      'price': '₹1,900',
    },
    {
      'image': 'assets/items/long jordan.png',
      'title': 'Jordan Stay.',
      'subtitle': 'The classic Air Jordan 12 to create a shoe',
      'price': '₹4,999',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomMainAppBar(
        title: 'stylish',
        logoPath: Images.darkappLogo,
        profileImagePath: Images.mens,
      ),
      body: Column(
        children: [
          Custom_textfield(hinttext: 'Search any Product...'),
          All_feature(text: '52,082+ Items'),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.62,
                ),
                itemBuilder: (context, index) {
                  final product = products[index];
                  return GestureDetector(
                    onTap: (){
                      Get.to(ProductDetailScreen());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 6,
                            offset: Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              product['image'] ?? '',
                              height: 160,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            child: Text(
                              product['title'] ?? '',
                              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            child: Text(
                              product['subtitle'] ?? '',
                              style: TextStyle(fontWeight: FontWeight.w400, color: Colors.black, fontSize: Sizes.sm),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              product['price'] ?? '',
                              style: TextStyle(color: Colors.green),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              children: [
                                Icon(Icons.star, color: Colors.orange, size: 16),
                                SizedBox(width: 4),
                                Text(
                                  product['rating'] ?? 'N/A',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
