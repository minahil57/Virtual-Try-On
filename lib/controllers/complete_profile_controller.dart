import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompleteProfileController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  // ignore: non_constant_identifier_names
  final TextEditingController GenderController = TextEditingController();

  final GlobalKey<FormState> formkeey = GlobalKey<FormState>();
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
    nameController.dispose();
    phoneController.dispose();
    super.onClose();
  }
}
