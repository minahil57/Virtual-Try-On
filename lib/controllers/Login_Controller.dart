import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_try_on/models/user_model.dart';
import 'package:virtual_try_on/services/user_services.dart';

import '../services/user_authentication_services.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final UserAuthentication userAuthentication = UserAuthentication();

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  RxBool agreedToTerms = false.obs;
  RxBool obscureText = true.obs;

  void toggleObscureText() {
    obscureText.value = !obscureText.value;
  }

  // void checkCredentials() async {
  //   currentuser.value = await UserServices.fetchUser();
  //   currentuser.refresh();
  // }

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
