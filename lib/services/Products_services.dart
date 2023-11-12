import 'dart:developer';

import '../config/supabase.dart';

class ProductServices{

   Future<List> FetchCategories() async{
    try {
      final response = await supabase.from('categories',).select('id,name').execute();
      if (response.data == null) {
        throw Exception('Error Fetching data');
      }

      return response.data as List<Map<String, dynamic>>; // Return the fetched data
    } catch (e) {
      print(e.toString());
      return []; // Return an empty list in case of an error
    }
  }



   Future<List<Map<String, dynamic>>> FetchProducts() async{
    try {
      final response = await supabase.from('products',).select('name,price,images').execute();
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