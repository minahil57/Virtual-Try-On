import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_try_on/core/colors.dart';
import 'package:virtual_try_on/services/Products_services.dart';

import '../models/product_model.dart';

class IndexController extends GetxController with GetTickerProviderStateMixin {
  final TextEditingController search = TextEditingController();
  RxInt currentIndex = 0.obs;
  // late RxList<Map<String, dynamic>> products = <Map<String, dynamic>>[].obs;
   late RxList<Map<String, dynamic>> categories = <Map<String, dynamic>>[].obs;
  RxList<ProductModel> products = <ProductModel>[].obs;
  final ProductServices product = ProductServices();


  final List<String> carouselItems = [
  'assets/images/promotion.png',
  'assets/images/promotion.png',
  'assets/images/promotion.png',
  'assets/images/promotion.png',
    'assets/images/promotion.png',
  ];

  void onInit() async {
    var category =  await product.FetchCategories();
    categories.assignAll(category);
    product.FetchProducts();
    update();
    update();
    super.onInit();
  }

  @override
  void onClose() {
    // Dispose of the tabController when the controller is closed
    super.onClose();
    currentIndex.dispose();
  }
}
