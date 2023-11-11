import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmEmailcontroller extends GetxController {
  final TextEditingController emailController = TextEditingController();

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}
