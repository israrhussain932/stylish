import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:stylish/src/features/authentication/controller/auth_controller.dart';
import 'package:stylish/src/features/authentication/screens/onboarding/onboarding.dart';
import 'package:stylish/src/util/theme/app_theme.dart';

void main() async{
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    Get.put(AuthController()); // Inject controller
    runApp(MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppTheme.LightTheme,
      darkTheme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      home:OnboardingScreen());

  }
}
