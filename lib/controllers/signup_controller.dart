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
    super.onClose();

     Future<void> registerUser(String email, String password,context,String name) async {
       try {
         AuthResponse response = await supabase.auth.signUp(email: email, password: password,);
         //String UserId = response.user!.id;
         if (response.user != null) {
           print('reg successfull')
           Get.to(() => LoginScreen());
         } else {
           // Handle the error
           throw Exception('Registration failed');
         }
       } catch (e) {
         // Handle exceptions
         String errorMessage = 'An unknown error occurred';
         if (e is Exception) {
           errorMessage = e.toString();
         }
         print(errorMessage);
         //Fluttertoast.showToast(msg: errorMessage,);
       }
     }

  }
 }