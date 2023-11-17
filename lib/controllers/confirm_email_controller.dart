import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/forget_password_services.dart';

class ConfirmEmailcontroller extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final FogetPassword confirmEmail = FogetPassword();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}
