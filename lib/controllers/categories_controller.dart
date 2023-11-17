import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/category_model.dart';
import '../services/products_services.dart';

class CategoriesController extends GetxController
    with GetTickerProviderStateMixin {
  final ProductServices product = ProductServices();
  final RxList<CategoryModel> categories = <CategoryModel>[].obs;
  late TabController tabController;
  late RxInt selectedTab = 0.obs;
  late int index = Get.arguments['index'];

  @override
  void onInit() async {
    tabController = TabController(length: categories.length, vsync: this);
    try {
      List<CategoryModel> allCategories = await product.fetchCategories();
      categories.value = allCategories;

      update();
      if (categories.isNotEmpty) {
        tabController = TabController(length: categories.length, vsync: this);
        selectedTab = RxInt(index);
        tabController.index = selectedTab.value;
      }
    } catch (e) {
      print(e.toString());
    }
    super.onInit();
  }

  @override
  void onClose() {
    selectedTab.dispose();
    super.onClose();
  }
}
