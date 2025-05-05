import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ChangePasswordController extends GetxController {
  final currentPassword = TextEditingController();
  final newPassword = TextEditingController();
  final confirmPassword = TextEditingController();
  var isCurrentObscure = true.obs;
  var isNewObscure = true.obs;
  var isConfirmObscure = true.obs;

  final formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final currentUser = FirebaseAuth.instance.currentUser;

  changePassword({email,currentPassword,newPassword}) async{
    String newPassword = confirmPassword.text.trim();
    final  cred = EmailAuthProvider.credential(email: email, password: currentPassword);
     await currentUser!.reauthenticateWithCredential(cred).then((value){
       currentUser!.updatePassword(newPassword);
     }).catchError((error){
       print(error.toString());
     });
  }


  @override
  void onClose() {
    currentPassword.dispose();
    newPassword.dispose();
    confirmPassword.dispose();
    super.onClose();
  }
}
