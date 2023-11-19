import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_try_on/screens/profile/setting_screen.dart';
import 'package:virtual_try_on/screens/wishlist_screen.dart';

import '../screens/cart/cart_screen.dart';
import '../screens/index_page/index_screen.dart';

class BottomBarController extends GetxController {
  RxInt selectedIndex = 0.obs;

  /// widget list
  final List<Widget> bottomBarPages = [
    const IndexScreen(),
    const WishListScreen(),
    const Cart_screen(),
    const ProfileScreen(),
  ];
}
