import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_try_on/models/cart_model.dart';
import 'package:virtual_try_on/services/cart_services.dart';

class Cart_Controller extends GetxController {
  final List<CartItemModel> _items = [
    CartItemModel(
      id: '1',
      quantity: 1,
      productId: '1',
      size: 'xl',
      color: Colors.black,
    ),
    CartItemModel(
      id: '2',
      quantity: 1,
      productId: '2',
      size: 'xl',
      color: Colors.black,
    ),
    CartItemModel(
      id: '3',
      quantity: 1,
      productId: '3',
      size: 'xl',
      color: Colors.black,
    ),
  ];

  RxList<CartItemModel> get items => _items.obs;
  int itemCount = 0;

  @override
  void onReady() {
    // get all cart items from db
    // final newItems = await CartServices.getCartItems();
    // _items = newItems;
    super.onReady();
  }

  void addToCart({required CartItemModel cart}) async {
    final itemExists = _items.any((item) => item.id == item.id);
    print('Mano');
    if (!itemExists) {
      print('hello moto');
      // Add Cart items service call here
      // final CartItemModel newItem = await CartServices.addToCartItem(
      //   cart: cart,
      //   // TODO: add current user cart id here
      //   cartId: '',
      // );
      // Update Cart total service call here
      _items.insert(
        0,
        cart,
      );
    } else {
      print('Hello moto 2');
      CartItemModel? existingItem =
          _items.firstWhere((item) => item.id == cart.id);

      if (existingItem.id != null) {
        print('mein yahan hun');
        existingItem.quantity = existingItem.quantity! + cart.quantity!;
        // Call update quantity service here
      }
    }
  }

  void decreaseQuantity(String itemId) {
    print('Item Id:$itemId');
    final cartItemIndex = _items.indexWhere((item) => item.id == itemId);
    print('cart Index:$cartItemIndex');
    if (cartItemIndex != -1) {
      print('Quantity:${_items[cartItemIndex].quantity}');
      if (_items[cartItemIndex].quantity != null &&
          _items[cartItemIndex].quantity! > 1) {
        print('items:$_items');

        _items[cartItemIndex].quantity = (_items[cartItemIndex].quantity! - 1)!;
        print('Quantity:${_items[cartItemIndex].quantity}');
        return;
      } else {
        _items.removeAt(cartItemIndex);
      }
    } else {
      _items.removeAt(cartItemIndex);
    }
  }

  void increaseQuantity(String itemId) {
    // print("object");
    // CartModel cartItem = _items.firstWhere((item) => item.id == itemId);

    // if (cartItem != null) {
    //   if (cartItem.quantity < 10) {
    //     cartItem.quantity += 1;
    //     print('Item Id: $itemId');
    //     print('New Quantity: ${cartItem.quantity}');
    //   } else {
    //     print('Quantity limit reached for item with Id: $itemId');
    //   }
    // } else {
    //   print('Item with Id: $itemId not found in cart');
    // }
  }

  void removeFromCart(String id) {
    _items.removeWhere((item) => item.id == id);
    print("item:${_items.length}");
    print(items.length);
  }

  void clearCart() {
    items.clear();
  }
}
