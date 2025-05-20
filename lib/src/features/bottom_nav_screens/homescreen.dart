import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylish/src/features/bottom_nav_screens/widgets/ImageSliderWithIndicator.dart';
import 'package:stylish/src/features/bottom_nav_screens/widgets/all_features.dart';
import 'package:stylish/src/features/bottom_nav_screens/widgets/container_widget.dart';
import 'package:stylish/src/features/bottom_nav_screens/widgets/custom_appbar.dart';
import 'package:stylish/src/features/bottom_nav_screens/widgets/custom_textfield.dart';
import 'package:stylish/src/features/bottom_nav_screens/widgets/list_product.dart';
import 'package:stylish/src/features/bottom_nav_screens/widgets/offer_card.dart';
import 'package:stylish/src/features/bottom_nav_screens/widgets/sponser_card.dart';
import 'package:stylish/src/features/bottom_nav_screens/widgets/summer_card.dart';
import 'package:stylish/src/features/bottom_nav_screens/widgets/time_limit_container.dart';
import '../../../controllers/all_feature_controller.dart';
import '../../../helpers/helper_function.dart';
import '../../constants/colors.dart';
import '../../constants/images.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  final AllFeatureController featureController = Get.put(AllFeatureController(FirebaseFirestore.instance));

  @override
  Widget build(BuildContext context) {
    final   darkMode =  HelperFunctions.isDarkMode(context);
    return  Scaffold(
      /// appbar
        appBar:CustomMainAppBar(
          title: 'stylish',
          logoPath: Images.darkappLogo,
          profileImagePath: Images.mens,),
        ///body
        body: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// TextField
                  Custom_textfield(hinttext: 'Search any Product...',),
                  /// all feature heading
                  All_feature(text: '"All Featured",',),
                  /// clipRRect
                  // Obx(() {
                  //   if (featureController.isLoading.value) {
                  //     return const Center(child: CircularProgressIndicator());
                  //   }
                  //   return SingleChildScrollView(
                  //     scrollDirection: Axis.horizontal,
                  //     child: Padding(
                  //       padding: const EdgeInsets.all(8.0),
                  //       child: Row(
                  //         children: featureController.allFeatures.map((feature) {
                  //           return Padding(
                  //             padding: const EdgeInsets.only(right: 10),
                  //             child: conainerWidget(
                  //               image: feature.imgURL,
                  //               text: feature.title,
                  //             ),
                  //           );
                  //         }).toList(),
                  //       ),
                  //     ),
                  //   );
                  // }),

                  StreamBuilder(
                    stream: Stream.value(featureController.allFeatures),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List? features = snapshot.data;
                        if (features != null) {
                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: features.map((feature) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: conainerWidget(
                                      image: feature.imgURL,
                                      text: feature.title,
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          );
                        } else {
                          return const Center(child: Text('No data available'));
                        }
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),

                  SizedBox(height: 15,),
                  /// card
                  ImageSliderWithIndicator(),

                  ///time_duration container
                  Time_Limit_Container(),
                  /// products
                  product_list(),
                  /// offer list
                  offer_card(),
                  /// list of  product
                  product_list(),
                  /// trending banner
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Container(
                      height: 80,
                      width: 340,
                      decoration: BoxDecoration(
                          color: TColors.buttonPrimary,
                          borderRadius: BorderRadius.circular(12)
                      ),
                      child: ListTile(
                        title: Text('Trending Products',style: TextStyle(fontSize: 19,color: Colors.white),),
                        subtitle: Text('📅 Last Date 29/02/22',style: TextStyle(fontSize: 12,color: Colors.white)),
                        trailing: TextButton(onPressed: () {},
                            child: Text('View all →',style: TextStyle(color: Colors.white),)),
                      ),
                    ),
                  ),
                  SummerSaleCard(),
                  sponser_card(),
                ]
            )
        )
    );
  }
}















// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:stylish/src/features/bottom_nav_screens/widgets/ImageSliderWithIndicator.dart';
// import 'package:stylish/src/features/bottom_nav_screens/widgets/all_features.dart';
// import 'package:stylish/src/features/bottom_nav_screens/widgets/container_widget.dart';
// import 'package:stylish/src/features/bottom_nav_screens/widgets/custom_appbar.dart';
// import 'package:stylish/src/features/bottom_nav_screens/widgets/custom_textfield.dart';
// import 'package:stylish/src/features/bottom_nav_screens/widgets/list_product.dart';
// import 'package:stylish/src/features/bottom_nav_screens/widgets/offer_card.dart';
// import 'package:stylish/src/features/bottom_nav_screens/widgets/sponser_card.dart';
// import 'package:stylish/src/features/bottom_nav_screens/widgets/summer_card.dart';
// import 'package:stylish/src/features/bottom_nav_screens/widgets/time_limit_container.dart';
//
// import '../../../helpers/helper_function.dart';
// import '../../../models/category_model.dart';
// import '../../../models/model_category.dart';
// import '../../constants/colors.dart';
// import '../../constants/images.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
// class _HomeScreenState extends State<HomeScreen> {
//   final CategoryService _categoryService = CategoryService(FirebaseFirestore.instance);
//   @override
//   Widget build(BuildContext context) {
//     final   darkMode =  HelperFunctions.isDarkMode(context);
//     return  Scaffold(
//            /// appbar
//          appBar:CustomMainAppBar(
//            title: 'stylish',
//            logoPath: Images.darkappLogo,
//            profileImagePath: Images.mens,),
//        ///body
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             /// TextField
//              Custom_textfield(hinttext: 'Search any Product...',),
//              /// all feature heading
//              All_feature(text: '"All Featured",',),
//             /// clipRRect
//             // SingleChildScrollView(
//             //   scrollDirection: Axis.horizontal,
//             //   child: Padding(
//             //     padding: const EdgeInsets.all(8.0),
//             //     child: Row(
//             //       children: [
//             //         conainerWidget(image: Images.clothIcon, text: 'Fashion',),
//             //         SizedBox(width: 10,),
//             //         conainerWidget(image: Images.sportIcon, text: 'Style',),
//             //         SizedBox(width: 10,),
//             //         conainerWidget(image: Images.mens, text: 'Women',),
//             //         SizedBox(width: 10,),
//             //         conainerWidget(image: Images.promoBanner1, text: 'Mens',),
//             //         SizedBox(width: 10,),
//             //         conainerWidget(image: Images.cosmeticsIcon, text: 'Kids',),
//             //         SizedBox(width: 10,),
//             //         conainerWidget(image: Images.specialshoes, text: 'Beauty',)
//             //       ],
//             //     ),
//             //   ),
//             // ),
//
//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: FutureBuilder<List<Category>>(
//                   future: _categoryService.getCategories(),
//                   builder: (context, snapshot) {
//                     if (snapshot.connectionState == ConnectionState.waiting) {
//                       return Row(children: [CircularProgressIndicator()]);
//                     } else if (snapshot.hasError) {
//                       return Text('Error loading categories');
//                     } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                       return Text('No categories found');
//                     }
//
//                     return Row(
//                       children: snapshot.data!
//                           .map((category) => Padding(
//                         padding: const EdgeInsets.only(right: 10.0),
//                         child: conainerWidget(
//                             image: category.imageURL, text: category.title),
//                       ))
//                           .toList(),
//                     );
//                   },
//                 ),
//
//               ),
//             ),
//
//             SizedBox(height: 15,),
//             /// card
//             ImageSliderWithIndicator(),
//             ///time_duration container
//             Time_Limit_Container(),
//             /// products
//             product_list(),
//             /// offer list
//             offer_card(),
//             /// list of  product
//             product_list(),
//             /// trending banner
//             Padding(
//               padding: const EdgeInsets.all(16),
//               child: Container(
//                 height: 80,
//                 width: 340,
//                 decoration: BoxDecoration(
//                     color: TColors.buttonPrimary,
//                     borderRadius: BorderRadius.circular(12)
//                 ),
//                 child: ListTile(
//                   title: Text('Trending Products',style: TextStyle(fontSize: 19,color: Colors.white),),
//                   subtitle: Text('📅 Last Date 29/02/22',style: TextStyle(fontSize: 12,color: Colors.white)),
//                   trailing: TextButton(onPressed: () {},
//                   child: Text('View all →',style: TextStyle(color: Colors.white),)),
//                 ),
//               ),
//             ),
//             SummerSaleCard(),
//             sponser_card(),
//           ]
//       )
//       )
//     );
//   }
// }
//
//
//
//
//
//
//
//
//
