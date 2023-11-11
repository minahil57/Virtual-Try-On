import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Checkout_Controller extends GetxController {
  final TextEditingController address_controller = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String? validateAddress(String value) {
    if (value.isEmpty) {
      return 'Please enter your shipping address.';
    }
    return null; // Return null if the input is valid
  }

  @override
  void onClose() {
    address_controller.dispose();
    super.onClose();
  }
}
