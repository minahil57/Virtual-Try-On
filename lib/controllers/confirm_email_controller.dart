import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/forget_password_services.dart';

class ConfirmEmailcontroller extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final fogetPassword confirmEmail = fogetPassword();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  void onClose() {
    // TODO: implement onClose
    emailController.dispose();
    super.onClose();

  }

}