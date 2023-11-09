import 'dart:developer';

import 'package:virtual_try_on/config/supabase.dart';
import 'package:virtual_try_on/models/cart_model.dart';

class CartServices {
  static Future<void> updateCart(
      {required String id, required double total}) async {
    try {
      await supabase.from('carts').update({'total': total}).eq('id', id);
    } catch (e) {
      log(e.toString());
    }
  }

  static Future<CartItemModel> addToCartItem(
      {required CartItemModel cart, required String cartId}) async {
    try {
      final CartItemModel newItem = await supabase
          .from('cart_items')
          .insert(cart.toJson())
          .select('*')
          .withConverter((data) => CartItemModel.fromJson(data));

      return newItem;
    } catch (e) {
      log(e.toString());
      return CartItemModel();
    }
  }
}
