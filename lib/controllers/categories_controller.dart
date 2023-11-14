import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/category_model.dart';
import '../services/Products_services.dart';

class Categories_Controller extends GetxController with GetTickerProviderStateMixin {

  final ProductServices product = ProductServices();
  final RxList<CategoryModel> categories = <CategoryModel>[].obs;
  late TabController tabController;



  final RxInt SelectedTab = 0.obs;


  @override
  void onInit() async {
    tabController = TabController(length: categories.length, vsync: this);
    try{
    List<CategoryModel> allCategories = await product.FetchCategories();
    categories.value = allCategories;

    update();
    if(categories.isNotEmpty){
      tabController = TabController(length: categories.length, vsync: this);
      tabController.index = SelectedTab.value;
      tabController.addListener(() {
        SelectedTab.value = tabController.index;
      });
    }
    }catch(e){
      print('nothing');
    }
    super.onInit();
  }

  @override
  void onClose() {


    super.onClose();
  }
}
