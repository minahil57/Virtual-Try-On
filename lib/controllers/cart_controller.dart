import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_try_on/controllers/index_controller.dart';
import 'package:virtual_try_on/helpers/show_toast.dart';

import 'package:virtual_try_on/models/cart_model.dart';

import '../services/cart_services.dart';

// ignore: camel_case_types
class Cart_Controller extends GetxController {
  RxDouble startX = 0.0.obs;
  final RxList<CartItemModel> items = <CartItemModel>[].obs;
  final IndexController indexController = Get.find();
  int itemCount = 0;

  @override
  void onReady() async {
    items.value = await CartServices.fetchCartItems(
        indexController.currentuser.value.cartid!);

    super.onReady();
  }

  void addToCart({required Map<String, dynamic> cart}) async {
    final itemExists =
        items.any((item) => item.products!.id == cart['product_id']);

    log('Exists $itemExists');

    if (!itemExists) {
      //Add Cart items service call here
      await CartServices.addToCartItem(
        cart: {
          "product_id": cart['product_id'],
          "cart_id": indexController.currentuser.value.cartid!,
          "size": cart['size'],
          "quantity": cart['quantity'],
          "color": cart['color'],
        },
        cartId: indexController.currentuser.value.cartid!,
      );

      CartServices.updateCart(
          id: indexController.currentuser.value.cartid!,
          total: calculateTotal());
    } else {
      showToast('Item already in cart');

      // Call update quantity service here
      // CartItemModel? existingItem =
      //     items.firstWhere((item) => item.id == cart['id']);

      // if (existingItem!.id != null) {
      //   existingItem.quantity =
      //       existingItem.quantity! + cart['quantity']! as int;
      //   // Call update quantity service here
      // }
    }
  }

  void decreaseQuantity(CartItemModel item) {
    // If quantity is one, remove item from cart
    if (item.quantity! <= 1) {
      removeFromCart(item.id!);
      items.refresh();
    } else {
      // else decrease the quantity

      item.quantity = item.quantity! - 1;
      items.refresh();
      CartServices.updateQuantity(item.id!, item.quantity!);
    }
  }

  void increaseQuantity(CartItemModel item) {
    if (item.quantity! != 10) {
      item.quantity = item.quantity! + 1;
      items.refresh();
      CartServices.updateQuantity(item.id!, item.quantity!);
    }
  }

  void removeFromCart(String id) {
    items.removeWhere((item) => item.id == id);
    items.refresh();
    CartServices.deleteItem(id);
  }

  void doNothing(BuildContext context) {}
  void clearCart() {
    items.value.clear();
  }

  double calculateTotal() {
    double total = 0.0;

    for (var item in items) {
      if (item.products!.price != null && item.quantity != null) {
        total += item.products!.price! * item.quantity!;
      }
    }

    return total;
  }

  @override
  void onClose() {
    // _items.dispose();
    startX.dispose();
    //items.dispose();
    super.onClose();
  }
}
