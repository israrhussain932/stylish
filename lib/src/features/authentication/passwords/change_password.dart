import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'changepassword_controller/change_password_controller.dart';

class ChangePasswordScreen extends StatefulWidget {
  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final controller = Get.put(ChangePasswordController());
  User? currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    const labelFontSize = 13.5;
    const textFontSize = 12.0;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Change Password',
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyMedium!.color,
          ),
        ),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Theme.of(context).textTheme.bodyMedium!.color,
            )),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              Obx(() => SizedBox(
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
                          color: Theme.of(context).textTheme.bodyMedium!.color,
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
                      validator: controller.validateCurrentPassword,
                    ),
                  )),
              SizedBox(height: 16),
              Obx(() => SizedBox(
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
                          color: Theme.of(context).textTheme.bodyMedium!.color,
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
                      validator: controller.validateNewPassword,
                    ),
                  )),
              SizedBox(height: 16),
              Obx(() => SizedBox(
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
                          color: Theme.of(context).textTheme.bodyMedium!.color,
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
                      validator: controller.validateConfirmPassword,
                    ),
                  )),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () async {
                  if (controller.formKey.currentState!.validate()) {
                    await controller.changePassword();
                  }
                },
                child: Text(
                  "Change Password",
                  style: TextStyle(color: Colors.pink),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
