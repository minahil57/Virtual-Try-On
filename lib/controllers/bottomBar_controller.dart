import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/cart/cart_screen.dart';
import '../screens/index_page/index_screen.dart';
import '../screens/product_detail/product_detail_screen.dart';
import '../screens/profile/profile_screen.dart';

class BottomBarController extends GetxController {
  RxInt selectedIndex = 0.obs;

  /// widget list
  final List<Widget> bottomBarPages = [
    //ReservationListScreen(),
    const IndexScreen(),
    SizedBox(),
    // ProductDetailsScreen3State(1),
    const Cart_screen(),
    const ProfileScreen(),
  ];
}
