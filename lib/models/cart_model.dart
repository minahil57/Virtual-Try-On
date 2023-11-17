import 'product_model.dart';

class CartItemModel {
  String? id;
  ProductModel? products;
  String? cartId;
  String? color;
  int? quantity;
  String? size;
  CartItemModel({
    this.id,
    this.products,
    this.cartId,
    this.quantity,
    this.color,
    this.size,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> map) {
    return CartItemModel(
      id: map['id'],
      products: ProductModel.fromJson(map['products']),
      cartId: map['cart_id'],
      quantity: map['quantity'],
      color: map['color'],
      size: map['size'],
    );
  }
}

class CartModel {
  final List<CartItemModel> items;
  final double total;

  CartModel({required this.items, required this.total});
}
