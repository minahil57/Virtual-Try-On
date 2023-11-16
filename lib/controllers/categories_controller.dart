import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/category_model.dart';
import '../services/Products_services.dart';

class Categories_Controller extends GetxController
    with GetTickerProviderStateMixin {

  final ProductServices product = ProductServices();
  final RxList<CategoryModel> categories = <CategoryModel>[].obs;
  late TabController tabController;
  late  RxInt SelectedTab = 0.obs;
  late int index = Get.arguments['index'];

  @override
  void onInit() async {
    tabController = TabController(length: categories.length, vsync: this);
    try {
      List<CategoryModel> allCategories = await product.FetchCategories();
      categories.value = allCategories;

      update();
      if (categories.isNotEmpty) {
          tabController = TabController(length: categories.length, vsync: this);
          SelectedTab = RxInt(index);
          tabController.index = SelectedTab.value;
          //print(tabController.index);
          // tabController.addListener(() {
          //   SelectedTab.value = tabController.index;
          //   print(SelectedTab.value);
          // });
      }
    } catch (e) {
      print(e.toString());
    }
    super.onInit();
  }

  @override
  void onClose() {
    SelectedTab.dispose();
    super.onClose();
  }
}
