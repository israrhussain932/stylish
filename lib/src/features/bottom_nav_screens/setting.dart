import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:stylish/src/features/bottom_nav_screens/profile_screen/profile_screen.dart';

import '../../constants/colors.dart';
import '../authentication/controller/auth_controller.dart';
import '../authentication/passwords/change_password.dart';
import '../authentication/screens/login/success screen/LogoutDialog.dart';
import 'notification_screen.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SearchState();
}

class _SearchState extends State<Setting> {
  final controller = Get.find<AuthController>(); // ✅ Use GetX properly   // ✅ Form key

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text("Account", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

          const SizedBox(height: 10),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Profile",style: TextStyle(fontSize: 15),),
            onTap: () {
            Get.to(ProfileScreen());
            },
          ),
          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text("Change Password",style: TextStyle(fontSize: 15),),
            onTap: () {
              Get.to(ChangePasswordScreen());
            },
          ),

          const Divider(height: 40),

          const Text("Preferences", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

          const SizedBox(height: 10),
          ListTile(
            leading: const Icon(Icons.notifications, color: Colors.white),
            title: const Text("notification", style: TextStyle(color: Colors.white,fontSize: 15)),
            onLongPress: (){
             NotificationScreen();
            },
          ),

          const Divider(height: 40),

          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text("Logout", style: TextStyle(color: TColors.buttonPrimary,fontSize: 15)),
            onTap: (){
              LogoutDialog.showLogoutDialog(
                onConfirm: () {
                  Get.find<AuthController>().logout();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}



