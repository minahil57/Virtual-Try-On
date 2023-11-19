import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:virtual_try_on/config/supabase.dart';
import 'package:virtual_try_on/helpers/show_toast.dart';

import '../models/product_model.dart';

class FavouritesServices {
  static Future<void> addToFav(String userId, productID) async {
    try {
      await EasyLoading.show();
      await supabase
          .from('favourite')
          .insert({'user_id': userId, 'product_id': productID});
      showToast("Added To Favourites");
      await EasyLoading.dismiss();
    } catch (e) {
      await EasyLoading.dismiss();

      showToast(e.toString());
    }
  }

  static Future<void> removeFromFav(String userId, productID) async {
    try {
      await EasyLoading.show();
      await supabase
          .from('favourite')
          .delete()
          .eq('user_id', userId)
          .eq('product_id', productID);
      showToast("Removed From Favourites");
      await EasyLoading.dismiss();
    } catch (e) {
      await EasyLoading.dismiss();
      showToast(e.toString());
    }
  }

  static Future<List<ProductModel>> fetchFavs() async {
    try {
      await EasyLoading.show();
      final response = await supabase
          .from('favourite')
          .select('*, products(*)')
          .eq('user_id', supabase.auth.currentUser!.id)
          .withConverter(
            (data) => List<ProductModel>.from(
              data.map((item) => ProductModel.fromJson(item['products'])),
            ),
          );
      await EasyLoading.dismiss();
      return response;
    } catch (e) {
      await EasyLoading.dismiss();
      return [];
    }
  }
}
