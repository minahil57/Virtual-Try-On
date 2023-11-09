import 'package:flutter/material.dart';

class CartItemModel {
  String? id;
  String? productId;
  Color? color;
  int? quantity;
  String? size;
  CartItemModel({
    this.id,
    this.productId,
    this.quantity,
    this.color,
    this.size,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> map) {
    return CartItemModel(
      id: map['id'],
      productId: map['productId'],
      quantity: map['quantity'],
      color: Color(int.parse('0xFF${map['color']}')),
      size: map['size'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'productId': 'productId',
      'quantity': quantity,
      'color': color!.value,
      'size': size,
    };
  }
}

class CartModel {
  final List<CartItemModel> items;
  final double total;

  CartModel({required this.items, required this.total});
}
