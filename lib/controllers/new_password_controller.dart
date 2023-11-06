import 'package:flutter/material.dart';
import 'package:get/get.dart';



class NewPasswordController extends GetxController {
  final TextEditingController newpasswordlController = TextEditingController();
  final TextEditingController confirmpasswordController = TextEditingController();

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  RxBool agreedToTerms = false.obs;
  RxBool obscureText = true.obs;

  void toggleObscureText() {
    obscureText.value = !obscureText.value;
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