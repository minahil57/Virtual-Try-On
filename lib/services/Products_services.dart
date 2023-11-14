import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:virtual_try_on/models/category_model.dart';
import 'package:virtual_try_on/models/product_model.dart';

import '../config/supabase.dart';

class ProductServices {
  Future<List<CategoryModel>> FetchCategories() async {
    try {
      EasyLoading.show();
      final response = await supabase
          .from('categories')
          .select('id,name,image')
          .withConverter(
            (data) => List<CategoryModel>.from(
              data.map((item) => CategoryModel.fromJson(item)),
            ),
          );
      EasyLoading.dismiss();
      return response;
    } catch (e) {
      EasyLoading.dismiss();
      print(e.toString());
      return []; // Return an empty list in case of an error
    }
  }

  Future<List<ProductModel>> FetchProducts() async {
    try {
      final productItems = await supabase
          .from('products')
          .select('id,name,price,images')
          .withConverter(
            (data) => List<ProductModel>.from(
          data.map((item) => ProductModel.fromJson(item)),
        ),
      );
      print(productItems);
      // print(productList);
      return productItems; // Return the fetched data
    } catch (e) {
      print(e.toString());
      return [] ;// Return an empty list in case of an error
    }
  }

}
