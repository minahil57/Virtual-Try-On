import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:get/get.dart';
import 'package:virtual_try_on/core/colors.dart';

void showToast(String message) => Get.rawSnackbar(
      message: message,
      maxWidth: Get.width * 0.8,
      snackPosition: SnackPosition.top,
      backgroundColor: AppColors.customBlack,
      borderRadius: 14,
      duration: const Duration(seconds: 2),
      barBlur: 10,
      overlayBlur: 2,
      shouldIconPulse: false,
      icon: const Icon(
        FlutterRemix.information_fill,
        color: Colors.white,
      ),
    );
