// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_try_on/controllers/cart_controller.dart';

class Checkout_Controller extends GetxController {
  // ignore: non_constant_identifier_names
  final TextEditingController address_controller = TextEditingController();
  // ignore: non_constant_identifier_names
  final CartController = Get.putOrFind(() => Cart_Controller());
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
