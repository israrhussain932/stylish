import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylish/src/features/authentication/screens/login/widgets/login_button.dart';
import 'changepassword_controller/change_password_controller.dart';

class ChangePasswordScreen extends StatefulWidget {
  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final controller = Get.put(ChangePasswordController());

  @override
  Widget build(BuildContext context) {
    const labelFontSize = 13.5;
    const textFontSize = 12.0;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Change Password',
          style: TextStyle(
            color: Theme
                .of(context)
                .textTheme
                .bodyMedium!
                .color,
          ),
        ),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios, color: Theme
            .of(context)
            .textTheme
            .bodyMedium!
            .color, )),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              Obx(() =>
                  SizedBox(
                    height: 55,
                    child: TextFormField(
                      controller: controller.currentPassword,
                      obscureText: controller.isCurrentObscure.value,
                      cursorHeight: 16,
                      style: TextStyle(fontSize: textFontSize),
                      decoration: InputDecoration(
                        labelText: 'Current Password',
                        labelStyle: TextStyle(
                          fontSize: labelFontSize,
                          color: Theme
                              .of(context)
                              .textTheme
                              .bodyMedium!
                              .color,
                        ),
                        floatingLabelStyle: TextStyle(fontSize: labelFontSize),
                        contentPadding:
                        EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        suffixIcon: IconButton(
                          icon: Icon(controller.isCurrentObscure.value
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () => controller.isCurrentObscure.toggle(),
                        ),
                      ),
                      validator: (value) =>
                      value == null || value.isEmpty
                          ? 'Enter current password'
                          : null,
                    ),
                  )),
              SizedBox(height: 16),
              Obx(() =>
                  SizedBox(
                    height: 55,
                    child: TextFormField(
                      controller: controller.newPassword,
                      obscureText: controller.isNewObscure.value,
                      cursorHeight: 16,
                      style: TextStyle(fontSize: textFontSize),
                      decoration: InputDecoration(
                        labelText: 'New Password',
                        labelStyle: TextStyle(
                          fontSize: labelFontSize,
                          color: Theme
                              .of(context)
                              .textTheme
                              .bodyMedium!
                              .color,
                        ),
                        floatingLabelStyle: TextStyle(fontSize: labelFontSize),
                        contentPadding:
                        EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        suffixIcon: IconButton(
                          icon: Icon(controller.isNewObscure.value
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () => controller.isNewObscure.toggle(),
                        ),
                      ),
                      validator: (value) =>
                      value != null && value.length < 6
                          ? 'Password must be at least 6 characters'
                          : null,
                    ),
                  )),
              SizedBox(height: 16),
              Obx(() =>
                  SizedBox(
                    height: 55,
                    child: TextFormField(
                      controller: controller.confirmPassword,
                      obscureText: controller.isConfirmObscure.value,
                      cursorHeight: 16,
                      style: TextStyle(fontSize: textFontSize),
                      decoration: InputDecoration(
                        labelText: 'Confirm New Password',
                        labelStyle: TextStyle(
                          fontSize: labelFontSize,
                          color: Theme
                              .of(context)
                              .textTheme
                              .bodyMedium!
                              .color,
                        ),
                        floatingLabelStyle: TextStyle(fontSize: labelFontSize),
                        contentPadding:
                        EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        suffixIcon: IconButton(
                          icon: Icon(controller.isConfirmObscure.value
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () => controller.isConfirmObscure.toggle(),
                        ),
                      ),
                      validator: (value) =>
                      value == null || value.isEmpty
                          ? 'Please confirm new password'
                          : null,
                    ),
                  )),
              SizedBox(height: 24),
              ElevatedButton(onPressed: ()
              async{
                if (controller.currentPassword.text.isNotEmpty ||
                    controller.confirmPassword.text.isNotEmpty) {
                  await  controller.changePassword(
                  email: 'ibrahim@gmail.com',
                  currentPassword:controller.currentPassword.text,
                  newPassword: controller.confirmPassword.text
                );
                }
              print("password change");
              },
                  child: Text("changePassword",style: TextStyle(color: Colors.pink),))
            ],
          ),
        ),
      ),
    );
  }
}
