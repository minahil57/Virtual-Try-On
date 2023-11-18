import 'dart:async';
import 'package:get/get.dart';
import 'package:virtual_try_on/config/supabase.dart';
import 'package:virtual_try_on/main.dart';
import 'package:virtual_try_on/models/user_model.dart';
import 'package:virtual_try_on/screens/auth_screens/complete_profile_screen.dart';
import 'package:virtual_try_on/screens/bottom_nav_screen.dart';
import 'package:virtual_try_on/screens/onboarding_screen.dart';
import 'package:virtual_try_on/services/user_services.dart';

class SplashController extends GetxController {
  late Timer timer;
  @override
  void onInit() async {
    timer = Timer.periodic(const Duration(seconds: 3), (timer) async {
      if (supabase.auth.currentSession != null) {
        currentuser.value = await UserServices.fetchUser();
        currentuser.refresh();
        if (currentuser.value.name != null) {
          Get.offAll(() => const BottomNavScreen());
        } else {
          Get.offAll(() => const CompleteProfile());
        }
      } else {
        Get.offAll(() => const OnBoardingScreen());
      }
    });
    super.onInit();
  }

  @override
  void onClose() {
    timer.cancel();
    super.onClose();
  }
}
