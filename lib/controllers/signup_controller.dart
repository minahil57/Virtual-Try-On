import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../services/user_authentication_services.dart';

 class SignupController extends GetxController {
   final TextEditingController email_controller = TextEditingController();
   final TextEditingController password_controller = TextEditingController();
   final TextEditingController name_controller = TextEditingController();
   final UserAuthentication userAuthentication = UserAuthentication();
   final GlobalKey<FormState> formkey = GlobalKey<FormState>();
   RxBool agreedToTerms = false.obs;
   RxBool obscureText = true.obs;

   void toggleObscureText() {
       obscureText.value = !obscureText.value;
   }

   @override
  void onClose() {
    // TODO: implement onClose
     email_controller.dispose();
     password_controller.dispose();
     name_controller.dispose();
     agreedToTerms.dispose();
     obscureText.dispose();
    super.onClose();

  }
 }