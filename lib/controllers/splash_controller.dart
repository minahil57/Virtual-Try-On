import 'dart:async';

import 'package:get/get.dart';
import 'package:virtual_try_on/config/supabase.dart';
import 'package:virtual_try_on/screens/bottom_nav_screen.dart';
import 'package:virtual_try_on/screens/onboarding_screen.dart';

class SplashController extends GetxController {
  late Timer timer;
  @override
  void onInit() {
    timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (supabase.auth.currentSession != null) {
        Get.offAll(() => const BottomNavScreen());
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
