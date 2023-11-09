import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../controllers/bottomBar_controller.dart';

class MyHomePage extends  GetView<BottomBarController> {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.putOrFind(() => BottomBarController());
    return Scaffold(
      body:
      PageView(
          controller: controller.pageController,
          allowImplicitScrolling: true,
          scrollBehavior: ScrollBehavior(),
          clipBehavior: Clip.antiAlias,
          dragStartBehavior: DragStartBehavior.start,
          padEnds: true,
          physics: const NeverScrollableScrollPhysics(),
          children: List.generate(
            controller.bottomBarPages.length, (index) => controller.bottomBarPages[index],)

      ),
      extendBody: true,
      bottomNavigationBar: (controller.bottomBarPages.length <= controller.maxCount)
          ? AnimatedNotchBottomBar(
        color: Theme.of(context).colorScheme.primary,
        showLabel: false,
        notchColor: Theme.of(context).colorScheme.onPrimary,
        notchBottomBarController: controller.controller,
        bottomBarItems:  [
          BottomBarItem(
            inActiveItem: Icon(
              Icons.home,
              //color: Colors.white,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            activeItem: Icon(
              Icons.home,
              color: Theme.of(context).colorScheme.primary,
            ),
            itemLabel: 'Page 1',
          ),
          BottomBarItem(
            inActiveItem: Icon(
              Icons.shopping_cart,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            activeItem: Icon(
              Icons.shopping_cart,
              color: Theme.of(context).colorScheme.primary,
            ),
            itemLabel: 'Page 2',
          ),

          BottomBarItem(
            inActiveItem: Icon(
              Icons.favorite_border,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            activeItem: Icon(
              Icons.favorite_border,
              color: Theme.of(context).colorScheme.primary,
            ),
            itemLabel: 'Page 3',
          ),
          BottomBarItem(
            inActiveItem: Icon(
              Icons.person_pin,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            activeItem: Icon(
              Icons.person_pin,
              color: Theme.of(context).colorScheme.primary,
            ),
            itemLabel: 'Page 3',
          ),
        ],
        onTap: (index) {
          /// control your animation using page controller
          controller.pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeIn,
          );
        },
      )
          : null,
    );
  }
}