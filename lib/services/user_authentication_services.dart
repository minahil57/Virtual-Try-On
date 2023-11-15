
import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:virtual_try_on/helpers/show_toast.dart';
import 'package:virtual_try_on/screens/auth_screens/complete_profile_screen.dart';
import 'package:virtual_try_on/screens/auth_screens/login_screen.dart';
import 'package:virtual_try_on/screens/bottom_nav_screen.dart';
import 'package:virtual_try_on/services/user_services.dart';
import '../config/supabase.dart';
import '../models/user_model.dart';

class UserAuthentication {

  Future<void> registerUser(
      String email, String password, context, String name) async {
    print(password);
    try {
      await EasyLoading.show();
      AuthResponse response = await supabase.auth.signUp(
        email: email,
        password: password,
      );
      await EasyLoading.dismiss();
      if (response.user != null) {
        // Registration successful
        showToast('Complete Your Profile First');
        Get.to(() => const CompleteProfile());
      } else {
        // Handle the error
        throw Exception('Registration failed');
      }
    } catch (e) {
      await EasyLoading.dismiss();
      // Handle exceptions
      String errorMessage = 'An unknown error occurred';
      if (e is Exception) {
        errorMessage = e.toString();
      }
      print(errorMessage);
      showToast(errorMessage);
    }
  }

  Future<void> loginUser(String email, String password, context) async {
    try {
      AuthResponse response = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      if (response.user != null) {
        showToast('Succefully Logged In');
        // Fluttertoast.showToast(msg: 'successfully Logged In');
        Get.offAll(() => const BottomNavScreen());
        // You can save the user session or handle the logged-in user here
      } else {
        // Handle the error
        throw Exception('Login failed');
      }
    } catch (e) {
      // Handle exceptions
      String errorMessage = 'An unknown error occurred';
      if (e is Exception) {
        errorMessage = e.toString();
      }
      showToast(errorMessage);
    }
  }


  Future<void> CompleteProfiles(String name,String number,dynamic gender) async{
    print(gender);
    try{
      await supabase.from('profiles').update({'name' : name,'phone':number,'gender':gender}).eq('id', supabase.auth.currentUser?.id).execute();
      showToast('Successfully Logged In');
      Get.to(() => BottomNavScreen());
    }catch(e){
      print(e);
    }
  }
}
