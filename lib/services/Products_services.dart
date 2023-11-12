import 'dart:developer';

import 'package:virtual_try_on/models/product_model.dart';

import '../config/supabase.dart';

class ProductServices{

  Future<List<Map<String, dynamic>>> FetchCategories() async{
    try {
      final response = await supabase.from('categories',).select('id,name,image').execute();
      if (response.data == null) {
        throw Exception('Error Fetching data');
      }

      List<Map<String, dynamic>> categoryList = [];
      for (var item in response.data as List<dynamic>) {
        if (item is Map<String, dynamic>) {
          categoryList.add(item);
        }
      }
      return categoryList;
    } catch (e) {
      print(e.toString());
      return []; // Return an empty list in case of an error
    }
  }



   Future<List<Map<String, dynamic>>> FetchProducts() async{
    try {
      final response = await supabase.from('products',).select('id,name,price,images').withConverter((data) => ProductModel.fromJson(data));;
      if (response.data == null) {
        throw Exception('Error Fetching data');
      }
      List<Map<String, dynamic>> productList = [];
      for (var item in response.data as List<dynamic>) {
        if (item is Map<String, dynamic>) {
          productList.add(item);
        }
      }

      print(productList);
      return productList;// Return the fetched data
    } catch (e) {
      print(e.toString());
      return []; // Return an empty list in case of an error
    }
  }
}