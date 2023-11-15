import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_try_on/models/cart_model.dart';

import '../services/cart_services.dart';

// ignore: camel_case_types
class Cart_Controller extends GetxController {
  RxDouble startX = 0.0.obs;
  RxList _items = [].obs;

  Rx<RxList> get items => _items.obs;
  int itemCount = 0;

  @override
  void onReady() {
    super.onReady();
  }

  void addToCart({required CartItemModel cart}) async {
    final itemExists = _items.any((item) => item.id == item.id);

    if (!itemExists) {
      //Add Cart items service call here
      final CartItemModel newItem = await CartServices.addToCartItem(
        cart: cart,
        // TODO: add current user cart id here
        cartId: '',
      );
      // Update Cart total service call here
      _items.insert(
        0,
        cart,
      );
    } else {
      CartItemModel? existingItem =
          _items.firstWhere((item) => item.id == cart.id);

      if (existingItem!.id != null) {
        existingItem.quantity = existingItem.quantity! + cart.quantity!;
        // Call update quantity service here
      }
    }
  }

  void decreaseQuantity(CartItemModel item) {
    // If quantity is one, remove item from cart
    if (item.quantity! <= 1) {
      removeFromCart(item.id!);
      _items.refresh();
    } else {
      // else decrease the quantity
      item.quantity = item.quantity! - 1;
      _items.refresh();
    }
  }

  void increaseQuantity(CartItemModel item) {
    if (item.quantity! != 10) {
      item.quantity = item.quantity! + 1;
      _items.refresh();
    }
  }

  void removeFromCart(String id) {
    _items.removeWhere((item) => item.id == id);
    _items.refresh();
  }

  void doNothing(BuildContext context) {}
  void clearCart() {
    items.value.clear();
  }

  double calculateTotal() {
    double total = 0.0;

    for (var item in _items) {
      if (item.price != null && item.quantity != null) {
        total += item.price! * item.quantity!;
      }
    }

    return total;
  }

  @override
  void onClose() {
    _items.dispose();
    startX.dispose();
    items.dispose();
    super.onClose();
  }
}
