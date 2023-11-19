import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_try_on/main.dart';
import 'package:virtual_try_on/models/category_model.dart';
import 'package:virtual_try_on/services/favourite_services.dart';
import 'package:virtual_try_on/services/product_services.dart';
import '../models/product_model.dart';

class IndexController extends GetxController with GetTickerProviderStateMixin {
  final TextEditingController search = TextEditingController();
  RxInt currentIndex = 0.obs;
  final RxList<CategoryModel> categories = <CategoryModel>[].obs;
  final RxList<ProductModel> products = <ProductModel>[].obs;
  final ProductServices product = ProductServices();

  final List<String> carouselItems = [
    'assets/images/promotion.png',
    'assets/images/promotion.png',
    'assets/images/promotion.png',
    'assets/images/promotion.png',
    'assets/images/promotion.png',
  ];
  @override
  void onInit() async {
    List<CategoryModel> allCategories = await product.fetchCategories();
    List<ProductModel> allProducts = await product.FetchProducts();
    products.value = allProducts;
    categories.value = allCategories;
    update();
    update();
    super.onInit();
  }

  void handleRemoveFromFav(String id, RxBool isFav) async {
    await FavouritesServices.removeFromFav(currentuser.value.id!, id);

    isFav.value = false;
  }

  void handleAddToFav(String id, RxBool isFav) async {
    await FavouritesServices.addToFav(currentuser.value.id!, id);
    isFav.value = true;
  }

  @override
  void onClose() {
    // Dispose of the tabController when the controller is closed
    currentIndex.dispose();
    super.onClose();
  }
}
