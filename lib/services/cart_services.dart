import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:virtual_try_on/config/supabase.dart';
import 'package:virtual_try_on/helpers/show_toast.dart';
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

  static Future<void> updateQuantity(String id, int quantity) async {
    try {
      await supabase
          .from('cart_details')
          .update({'quantity': quantity}).eq('id', id);
    } catch (e) {
      log(e.toString());
    }
  }

  static Future<void> clearCart(String cartid) async {
    try {
      await EasyLoading.show();
      await supabase.from('cart_details').delete().eq('cart_id', cartid);
      await EasyLoading.dismiss();
    } catch (e) {
      await EasyLoading.dismiss();
    }
  }

  static Future<void> deleteItem(String id) async {
    try {
      await EasyLoading.show();
      await supabase.from('cart_details').delete().eq('id', id);
      await EasyLoading.dismiss();
    } catch (e) {
      await EasyLoading.dismiss();
      log(e.toString());
    }
  }

  static Future<List<CartItemModel>> fetchCartItems(String id) async {
    try {
      await EasyLoading.show();
      final response = await supabase
          .from('cart_details')
          .select('*, products(id, images, price, name)')
          .eq('cart_id', id)
          .withConverter((data) => List<CartItemModel>.from(
              data.map((item) => CartItemModel.fromJson(item))));

      // CartItemModel - id, cart_id, product_id, quantity, size, color
      // oNn - id, cart_id, {images, price, name}, quantity, size, color

      await EasyLoading.dismiss();
      print(response);
      return response;
    } catch (e) {
      await EasyLoading.dismiss();
      print(e);
      showToast('Failed to fetch');
      return [];
    }
  }

  static Future<CartItemModel> addToCartItem(
      {required Map<String, dynamic> cart, required String cartId}) async {
    try {
      log('Cart ${cart}');
      await EasyLoading.show();
      final CartItemModel newItem = await supabase
          .from('cart_details')
          .insert(cart)
          .select('*, products(id, images, price, name)')
          .withConverter((data) => CartItemModel.fromJson(data[0]));
      await EasyLoading.dismiss();
      return newItem;
    } catch (e) {
      await EasyLoading.dismiss();
      log(e.toString());
      return CartItemModel();
    }
  }
}
