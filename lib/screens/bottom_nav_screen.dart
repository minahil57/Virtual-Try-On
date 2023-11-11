import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:virtual_try_on/core/colors.dart';

import '../controllers/bottomBar_controller.dart';

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
                  selectedIcon: Icon(FlutterRemix.home_2_fill),
                  icon: Icon(FlutterRemix.home_2_line),
                ),
                CustomNavigationBarItem(
                  selectedIcon: Icon(FlutterRemix.heart_fill),
                  icon: Icon(FlutterRemix.heart_line),
                ),
                CustomNavigationBarItem(
                  selectedIcon: Icon(FlutterRemix.shopping_bag_2_fill),
                  icon: Icon(FlutterRemix.shopping_bag_2_line),
                ),
                CustomNavigationBarItem(
                  selectedIcon: Icon(FlutterRemix.user_3_fill),
                  icon: Icon(FlutterRemix.user_3_line),
                ),
              ],
            ),
          ),
        ),
      ),

      // (controller.bottomBarPages.length <= controller.maxCount)
      //     ? AnimatedNotchBottomBar(
      //         color: Theme.of(context).colorScheme.primary,
      //         showLabel: false,
      //         notchColor: Theme.of(context).colorScheme.onPrimary,
      //         notchBottomBarController: controller.controller,
      //         bottomBarItems: [
      //           BottomBarItem(
      //             inActiveItem: Icon(
      //               Icons.home,
      //               //color: Colors.white,
      //               color: Theme.of(context).colorScheme.onPrimary,
      //             ),
      //             activeItem: Icon(
      //               Icons.home,
      //               color: Theme.of(context).colorScheme.primary,
      //             ),
      //             itemLabel: 'Page 1',
      //           ),
      //           BottomBarItem(
      //             inActiveItem: Icon(
      //               Icons.shopping_cart,
      //               color: Theme.of(context).colorScheme.onPrimary,
      //             ),
      //             activeItem: Icon(
      //               Icons.shopping_cart,
      //               color: Theme.of(context).colorScheme.primary,
      //             ),
      //             itemLabel: 'Page 2',
      //           ),
      //           BottomBarItem(
      //             inActiveItem: Icon(
      //               Icons.favorite_border,
      //               color: Theme.of(context).colorScheme.onPrimary,
      //             ),
      //             activeItem: Icon(
      //               Icons.favorite_border,
      //               color: Theme.of(context).colorScheme.primary,
      //             ),
      //             itemLabel: 'Page 3',
      //           ),
      //           BottomBarItem(
      //             inActiveItem: Icon(
      //               Icons.person_pin,
      //               color: Theme.of(context).colorScheme.onPrimary,
      //             ),
      //             activeItem: Icon(
      //               Icons.person_pin,
      //               color: Theme.of(context).colorScheme.primary,
      //             ),
      //             itemLabel: 'Page 3',
      //           ),
      //         ],
      //         onTap: (index) {
      //           /// control your animation using page controller
      //           controller.pageController.animateToPage(
      //             index,
      //             duration: const Duration(milliseconds: 500),
      //             curve: Curves.easeIn,
      //           );
      //         },
      //       )
      //     : null,
    );
  }
}
