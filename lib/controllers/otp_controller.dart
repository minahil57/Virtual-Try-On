import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:virtual_try_on/config/supabase.dart';
import 'package:virtual_try_on/screens/auth_screens/new_password.dart';

import '../services/forget_password_services.dart';

class OtpController extends GetxController {
  final TextEditingController otp = TextEditingController();
  static const borderColor = Color.fromRGBO(23, 171, 144, 0.4);
  final fogetPassword checkOTP = fogetPassword();
  final email = Get.arguments['email'];


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
