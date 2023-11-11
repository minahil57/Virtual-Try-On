import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
