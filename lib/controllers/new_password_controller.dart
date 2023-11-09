import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/forget_password_services.dart';



class NewPasswordController extends GetxController {
  final TextEditingController newpasswordlController = TextEditingController();
  final TextEditingController confirmpasswordController = TextEditingController();
  final fogetPassword updateUser = fogetPassword();
  final email = Get.arguments['email'];

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  RxBool agreedToTerms = false.obs;
  RxBool obscureText = true.obs;
  RxBool obscureText1 = true.obs;

  void toggleObscureText() {
    obscureText.value = !obscureText.value;
  }
  void toggleObscureTexts() {
    obscureText1.value = !obscureText1.value;
  }
  bool passwordVisible = false;
  void initState() {
    passwordVisible = true;
  }



  @override
  void onClose() {
    // TODO: implement onClose
    newpasswordlController.dispose();
    confirmpasswordController.dispose();
    super.onClose();

  }

}