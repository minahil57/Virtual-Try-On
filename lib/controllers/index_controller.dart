import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_try_on/models/category_model.dart';
import 'package:virtual_try_on/models/user_model.dart';
import 'package:virtual_try_on/services/Products_services.dart';
import '../models/product_model.dart';
import '../services/user_services.dart';

class IndexController extends GetxController with GetTickerProviderStateMixin {
  final TextEditingController search = TextEditingController();
  RxInt currentIndex = 0.obs;
  final RxList<CategoryModel> categories = <CategoryModel>[].obs;
  final RxList<ProductModel> products = <ProductModel>[].obs;
  final Rx<UserModel> currentuser = UserModel().obs;
  final ProductServices product = ProductServices();

  @override
  Future<void> onReady() async {
    currentuser.value = await UserServices.FetchUser();
    currentuser.refresh();
    super.onReady();
  }

  final List<String> carouselItems = [
    'assets/images/promotion.png',
    'assets/images/promotion.png',
    'assets/images/promotion.png',
    'assets/images/promotion.png',
    'assets/images/promotion.png',
  ];
  @override
  void onInit() async {
    List<CategoryModel> allCategories = await product.FetchCategories();
    List<ProductModel> allProducts = await product.FetchProducts();
    products.value = allProducts;
    categories.value = allCategories;
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
