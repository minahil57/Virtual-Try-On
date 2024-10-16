import 'dart:developer';
import 'dart:io';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:virtual_try_on/helpers/show_toast.dart';
import 'package:virtual_try_on/main.dart';
import 'package:virtual_try_on/screens/auth_screens/complete_profile_screen.dart';
import 'package:virtual_try_on/screens/bottom_nav_screen.dart';
import 'package:virtual_try_on/services/storage_services.dart';
import 'package:virtual_try_on/services/user_services.dart';

import '../config/supabase.dart';

class UserAuthentication {
//  final LoginController loginController = Get.find();
  Future<void> registerUser(String email, String password, context) async {
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
      log(e.toString());

      final error = e as AuthException;

      log(error.message);

      if (error.message == 'User already registered') {
        showToast('User already registered with this email');
      } else {
        showToast('Failed to signup');
      }
    }
  }

  Future<void> loginUser(String email, String password, context) async {
    try {
      await EasyLoading.show();
      AuthResponse response = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      if (response.user != null) {
        showToast('Succefully Logged In');
        currentuser.value = await UserServices.fetchUser();
        await EasyLoading.dismiss();
        if (currentuser.value.name == null) {
          showToast('Please complete your profile');
          Get.offAll(() => const CompleteProfile());
        } else {
          Get.offAll(() => const BottomNavScreen());
        }
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
    try {
      final String publicUrl = await StorageServices.uploadImage(
        bucket: 'profiles',
        name: supabase.auth.currentUser!.id,
        file: file,
      );
      await supabase.from('profiles').update({
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
    }
  }
}
