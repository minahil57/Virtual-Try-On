import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/auth_screens/complete_profile_screen.dart';
import '../screens/cart/cart_screen.dart';
import '../screens/index_page/index_screen.dart';
import '../screens/product_detail/product_detail_screen.dart';
import '../screens/profile/profile_screen.dart';

class BottomBarController extends GetxController with GetTickerProviderStateMixin {

  final pageController = PageController(initialPage: 0);
  final controller = NotchBottomBarController(index: 0);

  int maxCount = 4;

  /// widget list
  final List<Widget> bottomBarPages = [
    //ReservationListScreen(),
    const IndexScreen(),
    ProductDetailsScreen3State(),
    Cart_screen(),
    ProfileScreen(),

  ];

  void onInit() async {

    super.onInit();
  }

  @override
  void onClose() {
    // Dispose of the tabController when the controller is closed
    pageController.dispose();
    super.onClose();
  }

}