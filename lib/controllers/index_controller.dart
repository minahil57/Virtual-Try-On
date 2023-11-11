import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_try_on/core/colors.dart';

class IndexController extends GetxController with GetTickerProviderStateMixin {
  final TextEditingController search = TextEditingController();
  late final TabController tabController;
  final List<Widget> tabs = [
    const Tab(
        child: Text(
      "All",
      style: TextStyle(
        color: AppColors.primary,
      ),
    )),
    const Tab(
        child: Text(
      "Newest",
      style: TextStyle(
        color: AppColors.primary,
      ),
    )),
    const Tab(
        child: Text(
      "Popular",
      style: TextStyle(
        color: AppColors.primary,
      ),
    )),
  ];

  void onInit() async {
    tabController = TabController(length: tabs.length, vsync: this);
    //fetchData(restaurantId);
    tabController.addListener(() {
      // Do something when the tab changes
    });
    super.onInit();
  }

  @override
  void onClose() {
    // Dispose of the tabController when the controller is closed
    tabController.dispose();
    super.onClose();
  }
}
