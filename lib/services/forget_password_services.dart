import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:virtual_try_on/config/supabase.dart';
import 'package:virtual_try_on/helpers/show_toast.dart';
import 'package:virtual_try_on/screens/auth_screens/login_screen.dart';
import 'package:virtual_try_on/screens/auth_screens/otp_screen.dart';

import '../screens/auth_screens/new_password.dart';

class fogetPassword {
  Future<void> sendPasswordResetEmail(String email, context) async {
    await supabase.auth.resetPasswordForEmail(email);
    //Fluttertoast.showToast(msg: "OTP Sent to your email.");
    showToast('OTP Sent Successfully');
    Get.to(() => const OtpScreen(), arguments: {'email': email});
  }

  Future<void> CheckOTP(String Token, String email) async {
    try {
      final response = await supabase.auth.verifyOTP(
        token: Token,
        type: OtpType.recovery,
        email: email,
      );
      if (response.user != null) {
        showToast("OTP Verified");
        Get.to(() => const NewPasswordScreen(), arguments: {'email': email});
      }
    } catch (e) {
      showToast('$e');
    }
  }

  Future<void> UpdateUser(String Password) async {
    try {
      await supabase.auth.updateUser(UserAttributes(password: Password));
      showToast('Password Changed Successfully');
      Get.to(() => const LoginScreen());
      print('Password Changed Succesfully');
    }

    //Fluttertoast.showToast(msg: 'Password Changed Successfully.');
    catch (e) {
      showToast('$e');
    }
  }
}