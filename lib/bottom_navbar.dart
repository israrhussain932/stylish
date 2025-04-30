import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:stylish/src/constants/colors.dart';
import 'package:stylish/src/features/bottom_nav_screens/homescreen.dart';
import 'package:stylish/src/features/bottom_nav_screens/setting.dart';
import 'package:stylish/src/features/bottom_nav_screens/shop.dart';
import 'package:stylish/src/features/bottom_nav_screens/wishlist.dart';
import 'helpers/helper_function.dart';


class  NavigationMenu extends StatelessWidget {
  const  NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final  controller =   Get.put(NavigationController());
    final   darkMode =  HelperFunctions.isDarkMode(context);
    return  Scaffold(
        bottomNavigationBar: Obx(
              () => NavigationBar(
              height: 80,
              elevation: 0,
              selectedIndex:  controller.selectedIndex.value,
              onDestinationSelected: (index) =>  controller.selectedIndex.value = index ,
              backgroundColor: darkMode ? TColors.black :  Colors.white,
              indicatorColor:  darkMode ? TColors.white.withOpacity(0.1): TColors.black.withOpacity(0.1),
              destinations: const [
                NavigationDestination(icon: Icon(Iconsax.home), label: "Home",),
                NavigationDestination(icon: Icon(Iconsax.heart), label:"wishlist",),
                NavigationDestination(icon: Icon(Iconsax.shop), label: "store",),
                NavigationDestination(icon: Icon(Iconsax.setting), label: "setting",),

              ]
          ),
        ),
        body:   Obx(() => controller.screens[controller.selectedIndex.value])
    );
  }
}
class NavigationController extends GetxController{
  final Rx<int> selectedIndex = 0.obs;
  final screens =  [
    HomeScreen(),
    Wishlist(),
    Shop(),
    Setting(),
  ];
}