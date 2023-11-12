import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:virtual_try_on/config/supabase.dart';
import 'package:virtual_try_on/screens/auth_screens/login_screen.dart';
import 'package:virtual_try_on/screens/auth_screens/otp_screen.dart';

import '../helpers/show_toast.dart';
import '../screens/auth_screens/new_password.dart';

class fogetPassword{

  Future<void> sendPasswordResetEmail(String email,context) async {
    print(email);
    await supabase.auth.resetPasswordForEmail(email);
    //Fluttertoast.showToast(msg: "OTP Sent to your email.");
    showToast('Otp sent to your mail');
    Get.to(() => OtpScreen(),
    arguments: {'email': email}
    );

  }

  Future<void> CheckOTP(String Token, String email) async {

    try {
      final response = await supabase.auth.verifyOTP(token: Token,
        type: OtpType.recovery,
        email: email,
      );
      if(response.user != null){
        showToast('OTP Verified ');
        Get.to(() => const NewPasswordScreen(),
        arguments: {'email':email}
        );
      }

    } catch(e) {
      //Fluttertoast.showToast(msg: '$e');
    }
  }

  Future<void> UpdateUser(String Password) async {
    try {
        await supabase.auth.updateUser(UserAttributes(password: Password));
        showToast('Password Updated Successfully');
        Get.to(() => LoginScreen());

      }

      //Fluttertoast.showToast(msg: 'Password Changed Successfully.');
    catch(e) {
      //Fluttertoast.showToast(msg: '$e');
      print('password not changed');
    }
  }

}