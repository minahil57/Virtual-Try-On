import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomBarController extends GetxController with GetTickerProviderStateMixin {

  late RxInt currentPage = 0.obs;
  late TabController tabController;
  final List<Color> colors = [
    Colors.yellow,
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.pink,
  ];

  void onInit() async {
    tabController = TabController(length: 5, vsync: this);
    tabController.animation?.addListener(
          () {
        final value = tabController.animation!.value.round();
        if (value != currentPage) {
          changePage(value);
        }
      },
    );
    super.onInit();
  }

  @override
  void onClose() {
    // Dispose of the tabController when the controller is closed
    tabController.dispose();
    super.onClose();
  }
  void changePage(int newPage) {
    currentPage.value = newPage;
  }


}