import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OtpController extends GetxController{
  final TextEditingController otp = TextEditingController();
  @override
  void onClose() {
    // TODO: implement onClose
    otp.dispose();
    super.onClose();
  }
}