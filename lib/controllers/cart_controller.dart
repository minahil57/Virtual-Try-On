import 'dart:developer';

import 'package:get/get.dart';
import 'package:virtual_try_on/controllers/bottomBar_controller.dart';
import 'package:virtual_try_on/controllers/index_controller.dart';
import 'package:virtual_try_on/helpers/show_toast.dart';
import 'package:virtual_try_on/main.dart';
import 'package:virtual_try_on/main.dart';
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
    items.value = await CartServices.fetchCartItems(currentuser.value.cartid!);

    super.onReady();
  }

  void addToCart({required Map<String, dynamic> cart}) async {
    final itemExists =
        items.any((item) => item.products!.id == cart['product_id']);

    log('Exists $itemExists');

    if (!itemExists) {
      //Add Cart items service call here
      final CartItemModel newItem = await CartServices.addToCartItem(
        cart: {
          "product_id": cart['product_id'],
          "cart_id": currentuser.value.cartid!,
          "size": cart['size'],
          "quantity": cart['quantity'],
          "color": cart['color'],
        },
        cartId: currentuser.value.cartid!,
      );

      await CartServices.updateCart(
          id: currentuser.value.cartid!, total: calculateTotal());

      Get.back();
      final BottomBarController bottomBarController = Get.find();
      bottomBarController.selectedIndex.value = 2;
      showToast('Item added to cart');
      items.insert(0, newItem);
    } else {
      Get.back();
      final BottomBarController bottomBarController = Get.find();

      bottomBarController.selectedIndex.value = 2;
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

  void decreaseQuantity(CartItemModel item) async {
    // If quantity is one, remove item from cart
    if (item.quantity! <= 1) {
      removeFromCart(item.id!);
      items.refresh();
    } else {
      // else decrease the quantity

      item.quantity = item.quantity! - 1;
      items.refresh();
      await CartServices.updateQuantity(item.id!, item.quantity!);
      await CartServices.updateCart(
          id: currentuser.value.cartid!, total: calculateTotal());
    }
  }

  void increaseQuantity(CartItemModel item) async {
    if (item.quantity! != 10) {
      item.quantity = item.quantity! + 1;
      items.refresh();
      await CartServices.updateQuantity(item.id!, item.quantity!);
      await CartServices.updateCart(
          id: currentuser.value.cartid!, total: calculateTotal());
    }
  }

  void removeFromCart(String id) async {
    await CartServices.deleteItem(id);
    await CartServices.updateCart(
        id: currentuser.value.cartid!, total: calculateTotal());
    items.removeWhere((item) => item.id == id);
    items.refresh();
  }

  void clearCart() async {
    items.value = [];
    await CartServices.clearCart(currentuser.value.cartid!);
    await CartServices.updateCart(
        id: currentuser.value.cartid!, total: calculateTotal());

    items.refresh();
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
