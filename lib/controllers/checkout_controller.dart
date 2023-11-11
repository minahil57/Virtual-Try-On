import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Checkout_Controller extends GetxController {
  final TextEditingController address_controller = TextEditingController();
  @override
  void onClose() {
    address_controller.dispose();
    super.onClose();
  }
}
