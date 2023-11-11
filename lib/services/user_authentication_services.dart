// /import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:virtual_try_on/helpers/show_toast.dart';
import 'package:virtual_try_on/screens/bottom_nav_screen.dart';
import 'package:virtual_try_on/screens/index_page/index_screen.dart';
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
        showToast('Succefully Logged In');
        Get.offAll(() => BottomNavScreen());
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
      // Fluttertoast.showToast(msg: errorMessage,);
    }
  }

  Future<void> loginUser(String email, String password, context) async {
    try {
      AuthResponse response = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      if (response.user != null) {
        print('Login successful');
        // Fluttertoast.showToast(msg: 'successfully Logged In');
        UserModel user = UserModel(
          id: response.user!.id,
          //name: response.user!.name,
          email: response.user!.email,
          // Add more properties as needed
        );
        Get.offAll(() => BottomNavScreen());
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
      // Fluttertoast.showToast(msg: errorMessage,);
    }
  }
}
