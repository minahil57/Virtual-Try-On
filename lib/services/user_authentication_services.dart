import 'dart:developer';
import 'dart:io';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:virtual_try_on/helpers/show_toast.dart';
import 'package:virtual_try_on/screens/auth_screens/complete_profile_screen.dart';
import 'package:virtual_try_on/screens/bottom_nav_screen.dart';
import 'package:virtual_try_on/services/storage_services.dart';

import '../config/supabase.dart';

class UserAuthentication {
  Future<void> registerUser(
      String email, String password, context, String name) async {
    try {
      await EasyLoading.show();
      AuthResponse response = await supabase.auth.signUp(
        email: email,
        password: password,
      );
      await EasyLoading.dismiss();
      if (response.user != null) {
        // Registration successful
        showToast('Lets begin by completing your profile');
        Get.offAll(() => const CompleteProfile());
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
      await EasyLoading.show();
      AuthResponse response = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      await EasyLoading.dismiss();
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
      await EasyLoading.dismiss();
      final error = e as AuthException;

      log(error.message);

      if (error.message == 'Invalid login credentials') {
        showToast('Invalid login credentials');
      } else {
        showToast('An unexpected error occured');
      }
    }
  }

  Future<void> completeProfiles(
      String name, String number, dynamic gender, File file) async {
    print(gender);
    try {
      final String publicUrl = await StorageServices.uploadImage(
        bucket: 'profiles',
        name: supabase.auth.currentUser!.id,
        file: file,
      );
      final response = await supabase.from('profiles').update({
        'name': name,
        'phone': number,
        'gender': gender,
        'image': publicUrl,
      }).eq('id', supabase.auth.currentUser?.id);
      await EasyLoading.dismiss();
      showToast('Profile Completed');
      Get.offAll(() => const BottomNavScreen());
    } catch (e) {
      await EasyLoading.dismiss();
      showToast('Caught an unexpected error');
      print(e);
    }
  }
}
