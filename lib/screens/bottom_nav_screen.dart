import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:virtual_try_on/core/colors.dart';

import '../controllers/bottombar_controller.dart';

class BottomNavScreen extends GetView<BottomBarController> {
  const BottomNavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.putOrFind(() => BottomBarController());
    return Scaffold(
      body: Obx(
        () => controller.bottomBarPages[controller.selectedIndex.value],
      ),
      extendBody: true,
      bottomNavigationBar: Obx(
        () => Padding(
          padding: EdgeInsets.only(bottom: Platform.isAndroid ? 16.0.sp : 0),
          child: SizedBox(
            height: Platform.isIOS ? Get.width * 0.25 : Get.width * 0.15,
            child: CustomNavigationBar(
              currentIndex: controller.selectedIndex.value,
              scaleFactor: 0.4,
              isFloating: true,
              borderRadius: const Radius.circular(16),
              selectedColor: AppColors.primaryLight,
              strokeColor: Colors.transparent,
              unSelectedColor: AppColors.customGrey,
              backgroundColor: Colors.black,
              onTap: (index) => controller.selectedIndex.value = index,
              items: [
                CustomNavigationBarItem(
                  selectedIcon: const Icon(FlutterRemix.home_2_fill),
                  icon: const Icon(FlutterRemix.home_2_line),
                ),
                CustomNavigationBarItem(
                  selectedIcon: const Icon(FlutterRemix.heart_fill),
                  icon: const Icon(FlutterRemix.heart_line),
                ),
                CustomNavigationBarItem(
                  selectedIcon: const Icon(FlutterRemix.shopping_bag_2_fill),
                  icon: const Icon(FlutterRemix.shopping_bag_2_line),
                ),
                CustomNavigationBarItem(
                  selectedIcon: const Icon(FlutterRemix.user_3_fill),
                  icon: const Icon(FlutterRemix.user_3_line),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
