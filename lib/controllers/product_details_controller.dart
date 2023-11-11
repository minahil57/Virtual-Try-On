import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: camel_case_types
class Product_details_controller extends GetxController {
  RxInt selectedImageIndex = 0.obs;
  RxInt selectedSizeIndex = 0.obs;
  RxInt selectedColorIndex = 0.obs;
  RxDouble scrollPosition = 0.0.obs;
  RxList sizes = [
    'S',
    'M',
    'L',
    'XL',
    'XXL',
  ].obs;
  RxList images = [
    'assets/images/BlackPant1.PNG',
    'assets/images/BlackPant2.PNG',
    'assets/images/BlackPant3.PNG',
  ].obs;
  RxList colors = [
    {
      'label': 'Brown',
      'value': Colors.brown,
    },
    {
      'label': 'Pink',
      'value': Colors.pink,
    },
    {
      'label': 'Red',
      'value': Colors.red,
    },
    {
      'label': 'Orange',
      'value': Colors.orange,
    },
    {
      'label': 'Blue',
      'value': Colors.blue,
    },
    {
      'label': 'Black',
      'value': Colors.black,
    },
  ].obs;
  @override
  void onClose() {
    colors.dispose();
    images.dispose();
    sizes.dispose();
    selectedImageIndex.dispose();
    selectedSizeIndex.dispose();
    selectedColorIndex.dispose();
    scrollPosition.dispose();
    super.onClose();
  }
}
