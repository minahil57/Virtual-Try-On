import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:virtual_try_on/config/supabase.dart';
import 'package:virtual_try_on/helpers/show_toast.dart';
import 'package:virtual_try_on/screens/auth_screens/login_screen.dart';
import 'package:virtual_try_on/screens/auth_screens/otp_screen.dart';

import '../screens/auth_screens/new_password.dart';

class fogetPassword {
  Future<void> sendPasswordResetEmail(String email, context) async {
    try {
      EasyLoading.show();
      await supabase.auth.resetPasswordForEmail(email);
      //Fluttertoast.showToast(msg: "OTP Sent to your email.");
      EasyLoading.dismiss();
      showToast('OTP Sent Successfully');
      Get.to(() => const OtpScreen(), arguments: {'email': email});
    } catch (e) {
      print(e);
      EasyLoading.dismiss();
      showToast('Unexpected error occured');
    }
  }

  Future<void> CheckOTP(String Token, String email) async {
    try {
      await EasyLoading.show();
      final response = await supabase.auth.verifyOTP(
        token: Token,
        type: OtpType.recovery,
        email: email,
      );
      await EasyLoading.dismiss();
      if (response.user != null) {
        showToast("OTP Verified");
        Get.to(() => const NewPasswordScreen(), arguments: {'email': email});
      }
    } catch (e) {
      await EasyLoading.dismiss();
      showToast('An unexpected error occured');
    }
  }

  Future<void> UpdateUser(String Password) async {
    try {
      await EasyLoading.show();
      await supabase.auth.updateUser(UserAttributes(password: Password));
      await EasyLoading.dismiss();
      showToast('Password Changed Successfully');
      Get.to(() => const LoginScreen());
    }

    //Fluttertoast.showToast(msg: 'Password Changed Successfully.');
    catch (e) {
      await EasyLoading.dismiss();
      showToast('$e');
    }
  }
}
