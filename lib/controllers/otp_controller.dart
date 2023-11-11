import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class OtpController extends GetxController {
  final TextEditingController otp = TextEditingController();
  static const borderColor = Color.fromRGBO(23, 171, 144, 0.4);

  final focusNode = FocusNode();
  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(
      fontSize: 22,
      color: Color.fromRGBO(30, 60, 87, 1),
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(19),
      border: Border.all(color: borderColor),
    ),
  );
  @override
  void onClose() {
    otp.dispose();
    focusNode.dispose();
    super.onClose();
  }
}
