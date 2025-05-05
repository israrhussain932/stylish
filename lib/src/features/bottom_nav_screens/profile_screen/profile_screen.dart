import 'package:flutter/material.dart';
import 'package:stylish/src/features/authentication/screens/login/widgets/email_textfield.dart';
import 'package:stylish/src/features/authentication/screens/login/widgets/login_button.dart';
import 'package:stylish/src/features/authentication/screens/login/widgets/password_textfield.dart';
import 'package:stylish/src/features/bottom_nav_screens/profile_screen/widgets/input_textfield.dart';

import '../../authentication/controller/auth_controller.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  AuthController controller = AuthController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, ),
          onPressed: () => Navigator.pop(context), // Keep this working
        ),
        title: const Text("Checkout",),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Avatar
            Center(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.redAccent,
                    child: Icon(Icons.person, size: 50, color: Colors.white),
                  ),
                  CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.white,
                    child: IconButton(onPressed: (){}, icon: Icon(Icons.edit,color: Colors.blueAccent,size: 18,)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            const Text("Personal Details", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 10),

            EmailTextField(emailController:controller.emailController,),
            const SizedBox(height: 10),
            PasswordTextField(hintText: 'password', PasswordController: controller.passwordController,),
            const SizedBox(height: 5),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: const Text('Change Password', style: TextStyle(color: Colors.red)),
              ),
            ),
            const Divider(height: 30),
            const Text("Business Address Details", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 10),
             input_textfield(labelText: 'Pincode',),
            const SizedBox(height: 10),
            input_textfield(labelText: 'Address',),
            const SizedBox(height: 10),
            input_textfield(labelText: 'City',),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'State',
                labelStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),
                border: OutlineInputBorder(),
              ),
              value: 'N1 2LL,',
              items: const [
                DropdownMenuItem(value: 'N1 2LL,', child: Text('N1 2LL,',style: TextStyle(fontSize: 10),)),
                DropdownMenuItem(value: 'EC1A 1BB', child: Text('EC1A 1BB',style: TextStyle(fontSize: 10),)),
              ],
              onChanged: (val) {},
            ),
            const SizedBox(height: 10),
            input_textfield(labelText: 'Country',),
            const Divider(height: 30),
            const Text("Bank Account Details", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 10),
            const SizedBox(height: 10),
            input_textfield(labelText: 'Bank Account Number',),
            const SizedBox(height: 10),
            input_textfield(labelText: ' Account Holders name',),
            const SizedBox(height: 10),
            input_textfield(labelText: 'IFSC Code',),
            const SizedBox(height: 30),
            // Save Button
            LoginButton(text: "Save", onPressed: (){},

            )
          ],
        ),
      ),
    );
  }
}

