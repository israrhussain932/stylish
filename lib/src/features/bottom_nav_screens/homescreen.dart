import 'package:flutter/material.dart';
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

import '../../../helpers/helper_function.dart';
import '../../constants/colors.dart';
import '../../constants/images.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    conainerWidget(image: Images.clothIcon, text: 'Fashion',),
                    SizedBox(width: 10,),
                    conainerWidget(image: Images.sportIcon, text: 'Style',),
                    SizedBox(width: 10,),
                    conainerWidget(image: Images.mens, text: 'Women',),
                    SizedBox(width: 10,),
                    conainerWidget(image: Images.promoBanner1, text: 'Mens',),
                    SizedBox(width: 10,),
                    conainerWidget(image: Images.cosmeticsIcon, text: 'Kids',),
                    SizedBox(width: 10,),
                    conainerWidget(image: Images.specialshoes, text: 'Beauty',)
                  ],
                ),
              ),
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









