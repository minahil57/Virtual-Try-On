import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_try_on/models/product_model.dart';

// ignore: camel_case_types
class Product_details_controller extends GetxController {
  RxInt selectedImageIndex = 0.obs;
  RxInt selectedSizeIndex = 0.obs;
  RxInt selectedColorIndex = 0.obs;
  RxDouble scrollPosition = 0.0.obs;
  List<Color> colors = [];
  List<Color> convertHexColorStringsToColors(List<String> colorStrings) {
    for (String colorString in colorStrings) {
      // Remove the '#' symbol if it exists in the string
      if (colorString.startsWith("#")) {
        colorString = colorString.substring(1);
      }

      // Parse the color string as a hexadecimal integer
      int colorValue = int.parse(colorString, radix: 16);

      // Create a Color object from the parsed value
      Color color = Color(colorValue);

      colors.add(color);
    }

    return colors;
  }

  @override
  void onClose() {
    // colors.dispose();
    // images.dispose();
    // sizes.dispose();
    selectedImageIndex.dispose();
    selectedSizeIndex.dispose();
    selectedColorIndex.dispose();
    scrollPosition.dispose();
    super.onClose();
  }
}
