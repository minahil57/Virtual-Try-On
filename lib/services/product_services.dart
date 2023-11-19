import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:virtual_try_on/models/category_model.dart';
import 'package:virtual_try_on/models/product_model.dart';

import '../config/supabase.dart';

class ProductServices {
  Future<List<CategoryModel>> fetchCategories() async {
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

      return []; // Return an empty list in case of an error
    }
  }

  // ignore: non_constant_identifier_names
  Future<List<ProductModel>> FetchProducts() async {
    try {
      EasyLoading.show();
      final productItems = await supabase
          .from('products')
          .select('id,name,price,images,sizes,colors,description')
          .withConverter(
            (data) => List<ProductModel>.from(
              data.map((item) => ProductModel.fromJson(item)),
            ),
          );
      EasyLoading.dismiss();
      // print(productList);
      return productItems; // Return the fetched data
    } catch (e) {
      EasyLoading.dismiss();
      return []; // Return an empty list in case of an error
    }
  }

  static Future<List<ProductModel>> searchProducts(
      {required String query}) async {
    try {
      EasyLoading.show();
      final productItems = await supabase
          .from('products')
          .select('id,name,price,images,sizes,colors,description')
          .textSearch('name', '%$query%')
          .withConverter(
            (data) => List<ProductModel>.from(
              data.map((item) => ProductModel.fromJson(item)),
            ),
          );
      EasyLoading.dismiss();
      return productItems;
    } catch (e) {
      EasyLoading.dismiss();
      return [];
    }
  }
}
