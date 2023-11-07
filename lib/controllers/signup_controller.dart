import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:virtual_try_on/config/supabase.dart';
import 'package:virtual_try_on/screens/auth_screens/login_screen.dart';

 class SignupController extends GetxController {
   final TextEditingController email_controller = TextEditingController();
   final TextEditingController password_controller = TextEditingController();
   final TextEditingController name_controller = TextEditingController();
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